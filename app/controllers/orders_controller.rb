class OrdersController < ApplicationController
  def create
    @order = Order.new
    process_order_params params
  end 

  def update
    @order = Order.find params[:id]
    process_order_params params
  end

  private
    def process_order_params params
      raise "PipelinePageNotPresent" unless params[:pipeline_page_id].present?
      
      if params[:order].present?
        @order.update_accessors_and_virtual_attributes!(params[:order]) 
      else
        @order.save
      end

      check_email_validation params

      set_session @order.id
      @order.process_answers params[:questions_answers]
      @order.add_pipeline_page params[:pipeline_page_id]

      redirect_to_next_page params
    end

    def check_email_validation params
      if params[:order].present? && params[:order][:email].present?
        @order.validate_email = true
      else
        @order.validate_email = false
      end
    end

    def redirect_to_next_page params
      current_pipeline = @order.pipeline
      sequencer = @order.pipeline_page.sequencer
      pipeline_page = current_pipeline.get_pipeline_page_by_sequencer sequencer.next
      title = pipeline_page.title
      redirect_to page_path(country: current_pipeline.country.code, locale: current_pipeline.locale, serial: current_pipeline.serial, title: title)
    end

end

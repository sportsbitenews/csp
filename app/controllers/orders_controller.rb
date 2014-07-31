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
      
      check_email_validation params
  
      @order.assign_country_and_locale current_country, current_locale      

      if params[:order].present?
        @order.update_accessors_and_virtual_attributes!(params[:order]) 
      else
        @order.save
      end

      set_session @order.id
      @order.process_answers params[:questions_answers]
      @order.add_pipeline_page params[:pipeline_page_id]

      redirect_to_next_page
    end

    def check_email_validation params
      if params[:order].present? && (params[:order].include? "email")
        @order.requires_email_validation = true
      else
        @order.requires_email_validation = false
      end
    end

    def redirect_to_next_page
      # current_pipeline_page = @order.pipeline_page
      # sequencer = current_pipeline_page.sequencer
      # next_pipeline_page = current_pipeline_page.pipeline.get_pipeline_page_by_sequencer sequencer.next
      redirect_to page_path(@order.pipeline_page.redirect_to_page_params)
    end

end

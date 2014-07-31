class PipelinesController < ApplicationController
  def index
    @pipeline = Pipeline.locate domain: request.domain, country: current_country, locale: current_language_code

    pr @pipeline.inspect

    if @pipeline.present?
      redirect_to_pipeline_first_page
    else
      render text: "No Pipelines Present"
    end

  end

  def show
    pr params.inspect

    @pipeline = Pipeline.find_by(country: current_country, locale: params[:locale], serial: params[:serial]) unless @pipeline.present?

    if @pipeline.present?
      if params[:title].present?
        @pipeline_page = @pipeline.get_pipeline_page_by_title params[:title]
        
        if @pipeline_page.present?
          @page = @pipeline_page.page
          @current_sequencer = @pipeline_page.sequencer
          process_page
        else
          redirect_to_pipeline_first_page
        end
      else
        redirect_to_pipeline_first_page
      end
    else
      @pipeline = Pipeline.locate domain: request.domain, country: current_country, locale: current_language_code
      redirect_to_pipeline_first_page
    end
  end

  private
    def process_page
      reset_session if @pipeline_page.sequencer == 1

      next_sequencer = @current_sequencer.next
      @next_pipeline_page = @pipeline.get_pipeline_page_by_sequencer next_sequencer
      
      render :show
    end

    def redirect_to_pipeline_first_page
      redirect_to page_path(country: @pipeline.country.code, locale: @pipeline.locale, serial: @pipeline.serial, title: @pipeline.get_first_pipeline_page.title)
    end

end
class PipelinesController < ApplicationController
  def index
    @pipeline = Pipeline.locate domain: request.domain, country: current_country, locale: current_locale

    if @pipeline.present?
      redirect_to_pipeline_first_page 
    else
      render text: "No Pipelines Present"
    end

  end

  def show
    @pipeline = Pipeline.find_by(country: current_country, locale: params[:locale], serial: params[:serial]) unless @pipeline.present?

    if @pipeline.present?
      if params[:title].present?
        @current_pipeline_page = @pipeline.get_pipeline_page_by_title params[:title]
        
        if @current_pipeline_page.present?
          @page = @current_pipeline_page.page
          @current_sequencer = @current_pipeline_page.sequencer
          process_page
        else
          redirect_to_pipeline_first_page 
        end
      else
        redirect_to_pipeline_first_page 
      end
    else
      @pipeline = Pipeline.locate domain: request.domain, country: current_country, locale: current_locale
      redirect_to_pipeline_first_page 
    end
  end

  private
    def process_page
      reset_session if @current_pipeline_page.sequencer == 1

      if @current_sequencer.present?
        next_sequencer = @current_sequencer.next
        @next_pipeline_page = @pipeline.get_pipeline_page_by_sequencer next_sequencer
      end
      @ga_data = capture_ga_data

      render :show
    end

    def redirect_to_pipeline_first_page
      page_params = {country: @pipeline.country.code, locale: @pipeline.locale, serial: @pipeline.serial, title: @pipeline.get_first_pipeline_page.title}
      ga_data = capture_ga_data
      page_params.merge! ga_data if ga_data.present?
      redirect_to page_path(page_params)
    end

end
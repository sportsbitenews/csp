class PipelinesController < ApplicationController
  def index
    @pipeline = Pipeline.locate domain: request.domain, country: current_country, locale: current_language_code

    if @pipeline.present?
      redirect_to_pipeline_first_page
    else
      render text: "No Pipelines Present"
    end

  end

  def show
    @pipeline = Pipeline.find_by(country_id: params[:country_id], locale: params[:locale], serial: params[:serial]) unless @pipeline.present?

    if @pipeline.present?
      if params[:title].present?
        @page = pipeline.get_page_by_title params[:title]
      else
        redirect_to_pipeline_first_page
      end
    else
      @pipeline = Pipeline.locate domain: request.domain, country: current_country, locale: current_language_code
      redirect_to_pipeline_first_page
    end

    process_page

  end

  private
    def process_page
      pr __method__.to_s
    end

    def redirect_to_pipeline_first_page
      redirect_to page_path(country_id: @pipeline.country.id, locale: @pipeline.locale, serial: @pipeline.serial, title: @pipeline.get_first_pipeline_page.title)
    end

end
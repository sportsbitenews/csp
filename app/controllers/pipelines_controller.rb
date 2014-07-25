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
        @page = @pipeline.get_page_by_title params[:title]
        if @page.present?
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
      render partial: "pages/partials/#{@page.template}"
      # render partial: @page.template
    end

    def redirect_to_pipeline_first_page
      path = page_path(country: current_country.code, locale: @pipeline.locale, serial: @pipeline.serial, title: @pipeline.get_first_pipeline_page.title)
      pr path
      redirect_to path
    end

end
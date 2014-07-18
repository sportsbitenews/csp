class PipelinesController < ApplicationController
  def index
    @pipeline = Pipeline.locate domain: request.domain, country: current_country, locale: current_language_code

    if @pipeline.present?
      redirect_to page_path(country: @pipeline.country, locale: @pipeline.locale, serial: @pipeline.serial, title: @pipeline.get_first_pipeline_page.title)
    else
      render text: "No Pipelines Present"
    end

  end

  def show
    render text: params.inspect
  end
end
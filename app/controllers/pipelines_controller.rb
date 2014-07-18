class PipelinesController < ApplicationController
  def index
    @pipeline = Pipeline.locate domain: request.domain, country: current_country, locale: current_language_code

    if @pipeline.present?
      
    else
      render text: "No Pipelines Present"
    end

  end

  def show
    
  end
end
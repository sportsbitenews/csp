module PipelinePagesExt
  def add_page page
    self.pipeline_pages.find_or_create_by!(page_id: page.id)
  end

  #returns page
  def get_first_page
   return self.get_page_by_sequencer 1
  end

  #returns pipeline page instead of just page
  def get_first_pipeline_page
    return get_pipeline_page_by_sequencer 1
  end

  #returns page, pass integer sequencer
  def get_page_by_sequencer sequencer
    raise unless sequencer.is_a? Integer

    get_page_by_params sequencer: sequencer
  end

  #returns pipeline page by sequencer
  def get_pipeline_page_by_sequencer sequencer
    raise unless sequencer.is_a? Integer

    return get_pipeline_page_by_params sequencer: sequencer
  end

  def get_pipeline_page_by_title title
    get_pipeline_page_by_params title: title
  end

  #returns page, pass pipeline_page title, f.e. checkout-paymode
  def get_page_by_title title
    get_page_by_params title: title
  end

  private
    def get_page_by_params params
      pipeline_page = get_pipeline_page_by_params params
      return nil unless pipeline_page.present?
      return pipeline_page.page
    end

    def get_pipeline_page_by_params params
      pipeline_page = self.pipeline_pages.find_by(params)
      return nil unless pipeline_page.present?

      return pipeline_page
    end
end
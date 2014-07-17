module PipelinePagesExt
  def add_page page
    self.pipeline_pages.find_or_create_by!(page_id: page.id)
  end

  #returns page
  def get_first_page
   return self.get_page_by_sequencer 1
  end

  #returns page, pass integer sequencer
  def get_page_by_sequencer sequencer
    raise unless sequencer.is_a? Integer

    locate_page_by_params sequencer: sequencer
  end

  #returns page, pass pipeline_page title, f.e. checkout-paymode
  def get_page_by_title title
    locate_page_by_params title: title
  end

  private
    def locate_page_by_params params
      pipeline_page = self.pipeline_pages.find_by(params)
      return nil unless pipeline_page.present?
      return pipeline_page.page 
    end
end
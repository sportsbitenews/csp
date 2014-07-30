module OrderHelperMethodsExt
  def pipeline
    return self.pipeline_page.pipeline
  end

  def male?
    return self.gender == "male"
  end

  def female?
    return self.gender == "female"
  end
end
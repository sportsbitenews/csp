module OrderGoogleAnalyticsExt

  def source
    return eval(self.ga_data)[:source]
  end

  def medium
    return eval(self.ga_data)[:medium]
  end

  def term
    return eval(self.ga_data)[:term]
  end

  def content
    return eval(self.ga_data)[:content]
  end

  def campaign
    return eval(self.ga_data)[:campaign]
  end

end
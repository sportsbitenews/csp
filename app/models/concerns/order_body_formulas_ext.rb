module OrderBodyFormulasExt

  def m_weight
    return self.weight.to_f
  end

  def m_age
    return self.age.to_i
  end


  def height_squared
    if height.to_i > 0
      return ((height.to_f/100) * (height.to_f/100))
    else
      return ((1.8/100)*(1.8/100))
    end
  end
  
  def index
    bmi = 0
    bmi = m_weight.to_f / (height_squared)
    return bmi.round(2)
  end
  
  def ideal_index
    index_result = 0
    if gender == "female"
      index_result = 0.4 * m_weight.to_f / (height_squared) + (0.03 * m_age) + 11
    else
      index_result = 0.5 * m_weight.to_f / (height_squared) + 11.5
    end
    return index_result
  end
  
  def ideal_weight
    result = 0    
    result = ideal_index * height_squared
    result = 0 unless result > 0
    return result.round(0)
  end

  def formatted_goal current_country, positive: false
    if m_weight 
      goal = ideal_weight - m_weight
      # goal = fixed_goal
    
      if IMPERIAL_SYSTEM_COUNTRY_CODES.include? current_country.code
        goal = goal.to(:pounds).round(0)
      end

      if positive
        if goal > 0
          return "- #{goal.to_i}"
        elsif goal < 0
          return "#{goal.abs.to_i}"
        else
          return "0"
        end
      else
        # return "- #{goal.abs}"
        if goal > 0
          return "+ #{goal.to_i}"
        elsif goal < 0
          return "- #{goal.abs.to_i}"
        else
          return "0"
        end
      end

    else
      return 0
    end
  end
  
  def goal
    (ideal_weight - m_weight)
  end

  def fixed_goal
    if overweight < 2
      return 2
    else
      return goal
    end
  end

  def overweight
    if m_weight
      return (m_weight - ideal_weight)
    else
      return 0
    end
  end

  def similar
    ideal_weight
  end

  def potential
    if m_weight
      g = m_weight - ideal_weight
      if g <= 0
        return 85
      elsif g > 0 && g <= 30
        return (100 - (16 - (15.to_f * (g.to_f / 30.to_f)))).round(0)
      else
        return 99
      end
    else
      return 0
    end
  end
  
  def formatted_weight current_country
    if IMPERIAL_SYSTEM_COUNTRY_CODES.include?(current_country.code) && m_weight
      return m_weight.to(:pounds).floor
    else
      return m_weight
    end
  end
  
  def formatted_ideal_weight current_country
    # if overweight < 2
    #   ideal = self.weight - 2
    # else
    #   ideal = self.ideal_weight
    # end
    ideal = self.ideal_weight
    
    if IMPERIAL_SYSTEM_COUNTRY_CODES.include? current_country.code
      return ideal.to(:pounds).ceil
    else
      return ideal
    end
  end
  
  def formatted_height current_country
    if IMPERIAL_SYSTEM_COUNTRY_CODES.include? current_country.code
      feets = self.height.cm.to(:feet).floor
      inches = self.height.cm.to(:inches).ceil - (feets * 12)
      inches = 0 if inches < 0
      return "#{feets}' #{inches}''"
    else
      return "#{self.height} cm"
    end
  end

end
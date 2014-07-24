module OrderVirtualAttributesExt
  def update_accessors_and_virtual_attributes! params
    params.each do |key, value|

      if self.has_attribute? key
        send("#{key.to_s}=", value)
        next
      end

      log = Log.find_by(key: key, order: self)

      if log.present?
        update_virtual_attribute log, value
      else
        create_virtual_attribute key, value
      end
    end

    self.save!
  end

  # def method_missing(m, *args, &block)
  #   begin
  #     super
  #   rescue
  #     pr "WARNING: Trying to access undefined order method #{m.to_s} @ OrderVirtualAttributesExt"
  #   end
  # end 

  private
    def update_virtual_attribute log, value
      log.update_attributes!(value: value)
    end

    def create_virtual_attribute key, value
      Log.create!(key: key, value: value, order: self)

      self.class.send(:define_method, key.to_sym) do
        get_virtual_attribute(key)
      end
    end

    def get_virtual_attribute(attribute)
      log_with_attribute = self.logs.find_by(key: attribute)
      return log_with_attribute.present? ? log_with_attribute.value : nil
    end
end
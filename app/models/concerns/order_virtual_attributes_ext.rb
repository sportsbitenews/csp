module OrderVirtualAttributesExt
  ALLOWED_ORDER_DYNAMIC_VIRTUAL_ATTRIBUTES = [
    "name",
    "weight",
    "height",
    "age",
    "phone_number",
    "male"
  ]

  def update_accessors_and_virtual_attributes! params
    params.each do |key, value|
      unless ALLOWED_ORDER_DYNAMIC_VIRTUAL_ATTRIBUTES.include? key
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

  def method_missing(m, *args, &block)
    begin
      super
    rescue
      if ALLOWED_ORDER_DYNAMIC_VIRTUAL_ATTRIBUTES.include? m.to_s
        define_virtual_attribute_getter_method m.to_s 
      else 
        super 
      end
    end
  end 

  private
    def is_accessor_or_active_record_attribute? key
      return (self.has_attribute? key) || ((Order.instance_methods.include? key) && (Log.find_by(key: key).nil?))
    end

    def update_virtual_attribute log, value
      log.update_attributes!(value: value)
    end

    def create_virtual_attribute key, value
      Log.create!(key: key, value: value, order: self)

      define_virtual_attribute_getter_method key unless Order.instance_methods.include? key
    end

    def define_virtual_attribute_getter_method key
      self.class.send(:define_method, key.to_sym) do
        get_virtual_attribute(key)
      end
    end

    def get_virtual_attribute(attribute)
      log_with_attribute = self.logs.find_by(key: attribute)
      return log_with_attribute.present? ? log_with_attribute.value : nil
    end
end
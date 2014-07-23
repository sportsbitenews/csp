module OrderCategoryExt
  def assign_category
    return unless self.category.nil? && self.email.present?
    orders_with_same_email = Order.where(email: self.email).where("category IS NOT NULL").where.not(id: self.id)

    if orders_with_same_email.size <= 0 
      result = map_category
    else
      result = orders_with_same_email.first.category
    end
    self.category = result
  end

  private
    def get_last_order_with_email_and_category
      return Order.select([:email, :category]).where("email IS NOT NULL").where("category IS NOT NULL").order("id ASC").last
    end

    def map_category
      last_order = get_last_order_with_email_and_category
      return 1 unless last_order.present?
      category = last_order.category

      return 1 if category == 10
      return category.next
    end

end
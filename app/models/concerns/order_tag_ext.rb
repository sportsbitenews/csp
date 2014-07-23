module OrderTagExt
  def add_tag tag
    tag = Tag.find_or_create_by!(name: tag)
    self.order_tags.find_or_create_by!(tag_id: tag.id)
  end

  def remove_tag tag
    tag = Tag.find_by(name: tag)
    return unless tag.present?
    self.order_tags.where(tag_id: tag.id).delete_all
  end
end
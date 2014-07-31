module OrderTagExt
  def add_tag tag
    tag = Log.find_or_create_by!(order: self, key: "tag", value: tag)
  end

  def remove_tag tag
    tags = Log.where(order: self, key: "tag", value: tag)
    return unless tags.size > 0
    tags.delete_all
  end
end
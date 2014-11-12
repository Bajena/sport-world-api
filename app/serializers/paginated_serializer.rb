class PaginatedSerializer < ActiveModel::ArraySerializer
  def as_json(options={})
    result = super
    {
        items: result,
        total: object.total_entries,
        page: object.current_page
    }
  end
end

class Section
  class SearchReference < ::SearchReference
    collection_path '/admin/sections/:referenced_id/search_references'
    type self.name.demodulize.tableize
  end
end

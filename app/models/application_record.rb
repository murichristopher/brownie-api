class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  PROTECTED_FIELDS = %w[id created_at updated_at].map(&:to_sym)

  def self.creatable_fields
    column_names.map(&:to_sym).reject { |field| PROTECTED_FIELDS.include?(field) }
  end
end

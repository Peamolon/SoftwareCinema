class Employee < PrimaryRecord
  belongs_to :user
  has_one :multiplex, class_name: 'Multiplex',foreign_key: "mutiplex_id"
end

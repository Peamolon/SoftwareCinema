class Multiplex < PrimaryRecord
  has_many :cinemas, class_name: "Cinema"
end

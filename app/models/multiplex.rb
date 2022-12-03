class Multiplex < PrimaryRecord
  has_many :cinemas, class_name: "Cinema"

  def set_cinemas_number
    update(cinemas_number: cinemas.count)
  end
end

class User < PrimaryRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :client
  has_one :employee

  def full_name
    return "#{name} #{last_name}"
  end

  def has_completed_signed?
    if is_employee?
      return employee.present?
    end
    true
  end

  def is_employee?
    self.role == "Employee"
  end

  def is_client?
    self.role == "Client"
  end
end

class RegistrationsController < Devise::RegistrationsController
  protected


  def after_sign_up_path_for(resource)
    if resource.is_employee?
      new_employee_path
    else
      Client.create(user_id: resource.id)
      root_path
    end
  end
end

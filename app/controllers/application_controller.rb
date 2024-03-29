class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_user
    if current_teacher 
      current_teacher
    elsif current_student
      current_student
    else 
      null
    end
  end

  
  protected
  
  def after_sign_in_path_for(resource)
    puts "resource is #{resource}"
    return teachers_dashboard_home_path
  end
  
    def after_sign_out_path_for(scope)
    # return the path based on scope
    puts scope
    root_path
  end


  def devise_parameter_sanitizer
    if resource_class == Teacher
      Teacher::ParameterSanitizer.new(Teacher, :teacher, params)
    elsif resource_class == Student
      Student::ParameterSanitizer.new(Student, :student, params)
    else
      super # Use the default one
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :last_name, ])
  end
end


class Teacher::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:first_name, :last_name])

  end
end

class Student::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:student_number, :first_name, :last_name])
  end
end
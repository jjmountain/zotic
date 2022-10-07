class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

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
  end
end

class Student::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:student_number])
  end
end
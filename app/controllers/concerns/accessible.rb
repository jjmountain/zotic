module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    if current_teacher
      puts "current teacher is"
      puts current_teacher
      flash.clear
      # if you have rails_admin. You can redirect anywhere really
      redirect_to(authenticated_teacher_root_path) and return
    elsif current_student
      flash.clear
      # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
      redirect_to(authenticated_student_root_path) and return
    else
      puts "no current teacher or student"
    end
  end
end
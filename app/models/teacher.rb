class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :courses, dependent: :destroy

  def self.from_google(google_params)
    create_with(
      uid: google_params[:uid],
      provider: "google_oauth",
      first_name: google_params[:first_name],
      last_name: google_params[:last_name],
    ).find_or_create_by!(email: google_params[:email])
  end
end

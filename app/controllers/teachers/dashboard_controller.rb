class Teachers::DashboardController < ApplicationController
    before_action :authenticate_teacher!
    def home

    end
end

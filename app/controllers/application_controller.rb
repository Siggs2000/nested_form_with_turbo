class ApplicationController < ActionController::Base
    before_action :check_for_turbo_native
    protected
    

    def check_for_turbo_native
        @is_turbo_native_app = turbo_native_app?
    end
end

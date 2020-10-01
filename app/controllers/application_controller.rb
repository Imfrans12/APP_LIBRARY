class ApplicationController < ActionController::Base
before_action :authenticate_ms_user!
end

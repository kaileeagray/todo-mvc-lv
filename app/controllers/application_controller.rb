class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end

# loads all helper methods

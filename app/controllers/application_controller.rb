class ApplicationController < ActionController::Base
  before_action :authenticate_student!

#   before_action :authenticate_teacher!

#   include Pundit::Authorization

#   # Pundit: allow-list approach
#   after_action :verify_authorized, except: :index, unless: :skip_pundit?
#   after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

#   private

#   def skip_pundit?
#     devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
#   end
# end
end

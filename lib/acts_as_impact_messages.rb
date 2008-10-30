require "acts_as_impact_messages/constants"
require "acts_as_impact_messages/filter"
require "acts_as_impact_messages/injection"

ActionController::Base.extend(WebCo::ActsAs::ImpactMessages)

# Enable it by default for all controller in development mode
if RAILS_ENV == "development"
  ActionController::Base.class_eval do
    acts_as_impact_messages
  end
end

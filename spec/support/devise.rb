RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers, type: :request
  config.include Devise::Test::IntegrationHelpers, type: :system
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Warden::Test::Helpers

  config.before(:suite) do
    Warden.test_mode!
  end

  config.after(:each) do
    Warden.test_reset!
  end
end

module AuthHelpers
  def sign_in_user(user = nil)
    user ||= create(:user) # Assumindo que você está usando FactoryBot
    sign_in user
    user
  end
end

RSpec.configure do |config|
  config.include AuthHelpers, type: :request
  config.include AuthHelpers, type: :system
  config.include AuthHelpers, type: :controller
end

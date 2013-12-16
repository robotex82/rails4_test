require 'spec_helper'
include ActiveAdmin::SignInHelper

feature 'active admin' do
  describe 'as a logged in admin user' do
    background do
      admin_user = AdminUser.create!(email: "#[Time.zone.now]@example.com", password: '12345678', password_confirmation: '12345678')
      sign_in_with(admin_user.email, admin_user.password)
    end

    scenario 'I should be able to visit the dashboard' do
      visit '/admin'
      page.body.should include("Dashboard")
    end
  end
end

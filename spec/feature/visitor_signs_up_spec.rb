# spec/features/visitor_signs_up_spec.rb
require 'rails_helper'

feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    sign_up_with 'PSeudoouais', 'valid@example.com', '$taawktljasktlw4aagl'

    expect(page).to have_content('Se deconnecter')
  end

  scenario 'with invalid email' do
    sign_up_with 'PSeudooucsacais', 'invalid_email', '$taawktljasktlw4aagl'

    expect(page).to have_content('Inscription')
  end

  scenario 'with blank password' do
    sign_up_with 'PSeudoouaidqdqs', 'valid@example.com', ''

    expect(page).to have_content('Inscription')
  end

  scenario 'with blank pseudo' do
    sign_up_with '', 'valid@example.com', '$taawktljasktlw4aagl'

    expect(page).to have_content('Inscription')
  end

    def sign_up_with(pseudo, email, password)
      visit new_user_registration_path
      fill_in :user_username, with: pseudo
      fill_in :user_email, with: email
      fill_in :user_password, with: password
      fill_in :user_password_confirmation, with: password
      click_button 'Sign up'
    end
end
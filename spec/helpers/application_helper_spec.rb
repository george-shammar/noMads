require 'rails_helper'

RSpec.describe ApplicationHelper, type: :system do
    describe 'index page' do
        it 'shows home button' do
          visit root_path
          expect(page).to have_content('HOME')
        end

        it 'shows NOMADS button' do
            visit root_path
            expect(page).to have_content('NOMADS')
        end


        it 'shows sign up button' do
            visit root_path
            expect(page).to have_content('Sign up')
        end

        it 'shows sign in button' do
            visit root_path
            expect(page).to have_content('Sign in')
        end

        it 'shows Edit profile button' do
            @user = User.first_or_create!(fullname: 'Foo', username:'Foobar', email: 'foo@bar.com', password: '123456789', password_confirmation: '123456789')
            visit new_user_session_path
            fill_in 'Username', with: @user.username
            fill_in 'Email', with: @user.email
            fill_in 'Password', with: @user.password
            click_on 'Log in'
            expect(page).to have_content('Sign out')
        end

        it 'shows Sign out button' do
            @user = User.first_or_create!(fullname: 'Foo', username:'Foobar', email: 'foo@bar.com', password: '123456789', password_confirmation: '123456789')
            visit new_user_session_path
            fill_in 'Username', with: @user.username
            fill_in 'Email', with: @user.email
            fill_in 'Password', with: @user.password
            click_on 'Log in'
            expect(page).to have_content('Edit profile')
        end

        it 'counts followers' do
            @user = User.first_or_create!(fullname: 'Foo', username:'Foobar', email: 'foo@bar.com', password: '123456789', password_confirmation: '123456789')
            visit new_user_session_path
            fill_in 'Username', with: @user.username
            fill_in 'Email', with: @user.email
            fill_in 'Password', with: @user.password
            click_on 'Log in'
            expect(page).to have_content('Followers')
        end

    end
end
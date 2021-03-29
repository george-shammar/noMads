require 'rails_helper'

RSpec.describe ApplicationHelper, type: :system do
    describe 'index page' do
        it 'shows home button' do
          visit root_path
          expect(page).to have_content('HOME')
        end
    end
end
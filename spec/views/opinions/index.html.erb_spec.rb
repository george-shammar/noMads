require 'rails_helper'

RSpec.describe 'opinions/index', type: :view do
  before(:each) do
    assign(:opinions, [
             Opinion.create!(
               text: 'MyText'
             ),
             Opinion.create!(
               text: 'MyText'
             )
           ])
  end
end

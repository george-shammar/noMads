require 'rails_helper'

RSpec.describe "opinions/show", type: :view do
  before(:each) do
    @opinion = assign(:opinion, Opinion.create!(
      text: "MyText"
    ))
  end

  
end

require "rails_helper"

RSpec.describe LikesController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/opinions/1/likes").to route_to("likes#create", opinion_id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/opinions/1/likes/1").to route_to("likes#destroy", opinion_id: '1', id: '1')
    end

  end
end
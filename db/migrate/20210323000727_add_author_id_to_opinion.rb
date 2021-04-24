class AddAuthorIdToOpinion < ActiveRecord::Migration[6.1]
  def change
    add_column :opinions, :authorid, :integer
  end
end

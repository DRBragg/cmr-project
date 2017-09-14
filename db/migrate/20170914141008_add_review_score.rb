class AddReviewScore < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :score, :integer, default: 0
  end
end

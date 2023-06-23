class AddLikesToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :likes, :integer, :null:flase, default: 0
  end
end

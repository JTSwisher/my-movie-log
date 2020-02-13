class AddPosterColumn < ActiveRecord::Migration[4.2]
  def change
    add_column :movies, :poster, :string
  end
end

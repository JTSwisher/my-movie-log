class CreateMovies < ActiveRecord::Migration[4.2]

  def change
    create_table :movies do |t|
      t.string :title 
      t.integer :rating 
      t.text :comments
      t.date :date
      t.integer :user_id
    end 
  end

end

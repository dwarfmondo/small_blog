class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.references :user, foreign_key: true

      t.timestamps

      t.index [:user_id, :created_at], unique: true
    end
  end
end

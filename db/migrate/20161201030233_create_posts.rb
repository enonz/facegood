class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end

class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :link
      t.string :random_string
      t.string :create_at
      t.string :updated_at

      t.timestamps
    end
  end
end

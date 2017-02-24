class CreateH3Contents < ActiveRecord::Migration[5.0]
  def change
    create_table :h3_contents do |t|
      t.text :title
      t.integer :web_url_id

      t.timestamps
    end
  end
end

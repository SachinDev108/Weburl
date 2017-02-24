class CreateH2Contents < ActiveRecord::Migration[5.0]
  def change
    create_table :h2_contents do |t|
      t.text :title
      t.integer :web_url_id

      t.timestamps
    end
  end
end

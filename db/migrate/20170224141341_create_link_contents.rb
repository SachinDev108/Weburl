class CreateLinkContents < ActiveRecord::Migration[5.0]
  def change
    create_table :link_contents do |t|
      t.text :url
      t.integer :web_url_id

      t.timestamps
    end
  end
end

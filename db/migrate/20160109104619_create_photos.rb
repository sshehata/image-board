class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :user, index: true, foreign_key: true
      t.datetime :uploaded_on
      t.integer :views

      t.timestamps null: false
    end
  end
end

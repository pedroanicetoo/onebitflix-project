class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :favoritable, polymorphic: true, null: false

      t.timestamps
    end
  end
end

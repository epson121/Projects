class CreateUniqueKeys < ActiveRecord::Migration
  def change
    create_table :unique_keys do |t|
      t.string :value

      t.timestamps
    end
  end
end

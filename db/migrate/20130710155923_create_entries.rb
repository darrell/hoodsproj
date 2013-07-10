class CreateEntries < ActiveRecord::Migration
  def up
    create_table :entries do |t|
      t.text :name
      t.text :json
    end
  end

  def down
    drop_table :entries
  end
end

class CreateEntries < ActiveRecord::Migration
  def up
    create_table :entries do |t|
      t.text :name
      t.text :json
      if ActiveRecord::Base.connection.adapter_name == 'PostGIS'
        t.polygon :geom
      end
    end
  end

  def down
    drop_table :entries
  end
end

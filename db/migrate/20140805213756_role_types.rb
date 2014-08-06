class RoleTypes < ActiveRecord::Migration
  create_table :role_types do |t|
    t.string :name

    t.timestamps
  end
end

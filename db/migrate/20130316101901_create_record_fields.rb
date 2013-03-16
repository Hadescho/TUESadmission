class CreateRecordFields < ActiveRecord::Migration
  def change
    create_table :record_fields do |t|
      t.string :name
      t.string :field_type
      t.boolean :required
      t.belongs_to :record_type

      t.timestamps
    end
    add_index :record_fields, :record_type_id
  end
end

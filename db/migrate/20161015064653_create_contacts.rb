class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.text :comments #text for larger amounts of string

      t.timestamps
    end
  end
end

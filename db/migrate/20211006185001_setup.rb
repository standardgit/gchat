class Setup < ActiveRecord::Migration[6.0]
  def change
    create_table :setups do |t|
      t.string :email, null: false
      t.string :password

      t.timestamps
    end
  end
end
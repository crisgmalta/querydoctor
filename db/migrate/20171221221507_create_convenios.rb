class CreateConvenios < ActiveRecord::Migration[5.1]
  def change
    create_table :convenios do |t|
      t.string :nome

      t.timestamps
    end
  end
end

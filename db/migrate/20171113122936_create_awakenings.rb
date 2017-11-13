class CreateAwakenings < ActiveRecord::Migration[5.1]
  def change
    create_table :awakenings do |t|
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end

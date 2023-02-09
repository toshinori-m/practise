class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :content1
      t.string :content2
      t.string :content3
      t.string :content4

      t.timestamps
    end
  end
end

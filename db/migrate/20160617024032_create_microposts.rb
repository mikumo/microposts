class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.references :user, index: true, foreign_key: true
      t.text :summary
      t.string :purpose
      t.string :target
      t.string:period
      t.string :place
      t.string:reward
      t.text :qualification

      t.timestamps null: false
      t.index [:user_id, :created_at]
    end
  end
end

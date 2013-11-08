class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user, index: true
      t.integer :votable_id, index: true
      t.integer :votable_type, index: true
      t.boolean :up

      t.timestamps
    end

    add_index :votes, [:user_id, :votable_type, :votable_id], unique: true
  end
end

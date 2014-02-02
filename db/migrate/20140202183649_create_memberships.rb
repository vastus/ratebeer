class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :user, index: true
      t.references :beer_club, index: true

      t.timestamps
    end
  end
end


class CreateGroupImages < ActiveRecord::Migration
  def change
    create_table :groups_images, id: false do |t|
      t.belongs_to :group, index: true
      t.belongs_to :image, index: true
    end
  end
end

class AddAttachmentIconToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.has_attached_file :icon
    end
  end

  def self.down
    drop_attached_file :products, :icon
  end
end

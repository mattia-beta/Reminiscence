# == Schema Information
#
# Table name: things
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  image       :string(255)
#  kind        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Thing < ActiveRecord::Base

      attr_accessible :description, :image, :name, :kind

      mount_uploader :image, ImageUploader

      validates :description, :presence => true
      validates :image, :presence => true
      validates :name, :presence => true
      validates :kind, :presence => true

end

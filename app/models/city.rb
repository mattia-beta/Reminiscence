# == Schema Information
#
# Table name: cities
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  image       :string(255)
#  description :string(255)
#  year        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class City < ActiveRecord::Base

    attr_accessible :description, :image, :name, :year

    mount_uploader :image, ImageUploader

    validates :description, :presence => true
    validates :image, :presence => true
    validates :name, :presence => true
    validates :year, :presence => true

end

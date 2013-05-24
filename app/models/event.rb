# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  image       :string(255)
#  date        :date
#  kind        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ActiveRecord::Base

      attr_accessible :date, :description, :image, :name, :kind

      mount_uploader :image, ImageUploader

      validates :description, :presence => true
      validates :image, :presence => true
      validates :name, :presence => true
      validates :kind, :presence =>  true
      validates :date, :presence => true

end

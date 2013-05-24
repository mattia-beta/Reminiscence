# == Schema Information
#
# Table name: memories
#
#  id         :integer          not null, primary key
#  titolo     :string(255)
#  testo      :string(255)
#  data       :datetime
#  privato    :boolean
#  luogo      :string(255)
#  senior_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :string(255)
#

class Memory < ActiveRecord::Base

    attr_accessible :data, :luogo, :privato, :senior_id, :testo, :titolo, :image

    belongs_to :senior

    mount_uploader :image, ImageUploader

    SOLO_CARATTERI = /^[a-zA-Z\s]*$/

    validates :data, :presence => true
    validates :luogo, :presence => true, :format => { :with => SOLO_CARATTERI}
    validates :testo, :presence => true
    validates :titolo, :presence => true

end

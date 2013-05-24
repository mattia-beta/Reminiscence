# == Schema Information
#
# Table name: seniors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  surname    :string(255)
#  birthday   :datetime
#  city       :string(255)
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Senior < ActiveRecord::Base

    attr_accessible :name, :surname, :birthday, :city , :image

    belongs_to :user
    has_many :memories

    mount_uploader :image, ImageUploader


    SOLO_CARATTERI = /^[a-zA-Z\s]*$/
    CARATTERI_SIMBOLI = /^[a-zA-Z\s-]*$/

    validates :name, :presence => true, :format => {:with => SOLO_CARATTERI}
    validates :surname, :presence => true, :format => {:with => SOLO_CARATTERI}
    validates :city, :presence => true,  :format => {:with => CARATTERI_SIMBOLI}
    validates :birthday, :presence => true

    validates :user_id, :presence => true


    has_many :friendships
    has_many :friends, :through => :friendships
    has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
    has_many :inverse_friends, :through => :inverse_friendships, :source => :senior




    def self.search(search)
        if search
            find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
        else
            find(:all)
        end
    end



end

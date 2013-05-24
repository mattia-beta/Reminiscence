# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  surname     :string(255)
#  mail        :string(255)
#  lang        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  id_facebook :string(255)
#

class User < ActiveRecord::Base

    attr_accessible :lang, :mail, :name, :surname, :id_facebook

    has_many :seniors

    validates :name, :presence => true
    validates :surname, :presence => true
    validates :mail, :presence => true
    validates :lang, :presence => true
    validates :id_facebook, :presence => true

end

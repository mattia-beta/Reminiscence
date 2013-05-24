# == Schema Information
#
# Table name: friendships
#
#  id         :integer          not null, primary key
#  senior_id  :integer
#  friend_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Friendship < ActiveRecord::Base

    attr_accessible :friend_id, :senior_id

    belongs_to :senior
    belongs_to :friend, :class_name => "Senior"

end

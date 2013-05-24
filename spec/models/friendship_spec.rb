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

require 'spec_helper'

describe Friendship do
  pending "add some examples to (or delete) #{__FILE__}"
end

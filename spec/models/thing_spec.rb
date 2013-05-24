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

require 'spec_helper'

describe Thing do
  pending "add some examples to (or delete) #{__FILE__}"
end

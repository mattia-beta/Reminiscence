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

require 'spec_helper'

describe City do
  let(:city) {City.new description: "ciao", name: "Trento", year: "2013"}

  it "should have an image" do
    city.should_not be_valid
  end
end



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


require 'spec_helper'

describe "seniors/edit.html.erb" do

  it 'should do something' do

    #To change this template use File | Settings | File Templates.
    true.should == false
  end
end
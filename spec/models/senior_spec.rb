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

describe Senior do

  before { @senior = Senior.new(name: "nome", surname: "cognome",
        birthday: 1900/01/01, city: "Bolzano")

        @senior.user_id = 12345}


  subject { @senior }

  #test if exists
  it { should respond_to (:name)}
  it { should respond_to (:surname)}
  it { should respond_to (:birthday)}
  it { should respond_to (:city)}
  it { should respond_to (:user_id)}

  describe "when name is not present" do
    before { @senior.name = " " }
    it { should_not be_valid }
  end

  describe "when name is not in the correct format" do
    before { @senior.name = "+*no/me"}
    it { should_not be_valid }
  end

  describe "when surname is not present" do
    before { @senior.surname = " " }
    it { should_not be_valid }
  end

  describe "when surname is not in the correct format" do
    before { @senior.surname = "+*cogno/me"}
    it { should_not be_valid }
  end

  describe "when city is not present" do
    before { @senior.city = " " }
    it { should_not be_valid}
  end

  describe "when city is not in the correct format" do
    before { @senior.city = "Bolz0ano" }
    it { should_not be_valid}
  end

  describe "when user_id is not present" do
    before { @senior.user_id = nil }
    it { should_not be_valid }
  end

end

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

require 'spec_helper'


describe User do

  before { @user = User.new(name: "userName", surname: "userSurname",
              mail: "user@example.com" , lang: "it-IT",
              id_facebook: "100000065")}

  subject { @user }

  #test if it exists
  it { should respond_to (:name) }
  it { should respond_to (:surname)}
  it { should respond_to (:mail)}
  it { should respond_to (:lang)}
  it { should respond_to (:id_facebook)}


  describe "when name is not present " do
    before { @user.name = " "}
    it { should_not be_valid}
  end

  describe "when surname is not present" do
    before { @user.surname = " "}
    it { should_not be_valid }
  end

  describe "when mail is not present" do
    before { @user.mail = " "}
    it { should_not be_valid }
  end

  describe "when lang is not present" do
    before { @user.lang = " "}
    it { should_not be_valid }
  end

  describe "when id_facebook is not present" do
    before { @user.id_facebook = " "}
    it { should_not be_valid}
  end


end
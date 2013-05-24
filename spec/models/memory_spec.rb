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

require 'spec_helper'

describe Memory do

  before { @Memory = Memory.new(data: DateTime.now, luogo: "Bolzano",
          privato: true, senior_id: 12356, titolo: "Ricordo",
  testo: "Che bella giornata.")}

  subject { @Memory }

  #test if it exist
  it { should respond_to (:data)}
  it { should respond_to (:luogo)}
  it { should respond_to (:privato)}
  it { should respond_to (:senior_id)}
  it { should respond_to (:titolo)}
  it { should respond_to (:testo)}


  describe "when text is not present" do
    before { @Memory.testo = " "}
    it { should_not be_valid }
  end

  describe "when title is not present" do
    before { @Memory.titolo = " "}
    it { should_not be_valid }
  end

  describe "when luogo is not present" do
    before { @Memory.luogo = " "}
    it { should_not be_valid }
  end

  describe "when luogo is present, but not in the correct format" do
    before { @Memory.luogo = " +/Bolzano*"}
    it { should_not be_valid }
  end

  describe "when data is in the future" do
  before { @Memory.data = "3000/01/01" } # bug!
  it { should_not be_valid}
  end

  describe "when data is not in the correct format" do
    before { @Memory.data = "2013/kj/06"}
    it { should_not be_valid}
  end

end

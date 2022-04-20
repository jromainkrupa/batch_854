require "rspec"
require_relative "../citizen"

describe Citizen do
  describe "#can_vote?" do
    it "returns true if the citizen is 18 years old" do
      citizen = Citizen.new("", "", 21)

      expect(citizen.can_vote?).to eq(true)
    end

    it "returns false if the citizen is less than 18 years old" do
      citizen = Citizen.new("", "", 16)

      expect(citizen.can_vote?).to eq(false)
    end
    it "returns false if the citizen is perfectly 18 years old" do
      citizen = Citizen.new("", "", 18)

      expect(citizen.can_vote?).to eq(true)
    end
  end

  describe "#full_name" do
    it "should return the name of the citizen clean" do
      citizen1 = Citizen.new("   JeaN", " KruPa", "")
      citizen2 = Citizen.new("  toto", " Titi", "")

      expect(citizen1.full_name).to eq "Jean KRUPA"
      expect(citizen2.full_name).to eq "Toto TITI"
    end
  end
end

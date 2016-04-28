require "rails_helper"

RSpec.describe Winery, :type => :model do

  describe "validations" do
    it {expect(subject).to validate_presence_of(:name)}
    it {expect(subject).to validate_presence_of(:address)}
    it {expect(subject).to validate_presence_of(:city)}
    it {expect(subject).to validate_presence_of(:state)}
    it {expect(subject).to validate_presence_of(:phone)}
    it {expect(subject).to validate_presence_of(:website)}

    it {expect(subject).to validate_presence_of(:blog)}
    it {expect(subject).to validate_presence_of(:email)}
    it {expect(subject).to validate_presence_of(:facebook)}
    it {expect(subject).to validate_presence_of(:twitter)}
  end

  describe "associations" do
    it {expect(subject).to have_and_belong_to_many(:varietals)}
  end
end
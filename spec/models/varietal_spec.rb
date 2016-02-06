require "rails_helper"

RSpec.describe Varietal, :type => :model do

  describe "validations" do
    it {expect(subject).to validate_presence_of(:name)}
    it {expect(subject).to validate_presence_of(:color)}
    it {expect(subject).to validate_presence_of(:photo_url)}
  end

  describe "associations" do
    it {expect(subject).to have_and_belong_to_many(:wineries)}
  end
end
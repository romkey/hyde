require 'spec_helper'

require 'hyde/version'

describe Hyde do
  context "Version number" do
    it "Has a version number" do
      expect(Hyde::VERSION).not_to be_nil
      expect(Hyde::VERSION.class).to be String
    end
  end 
end

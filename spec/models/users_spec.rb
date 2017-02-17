require "rails_helper"

describe User do
  it { should have_many(:pictures).through :comments }
  it { should have_many :tags }
end

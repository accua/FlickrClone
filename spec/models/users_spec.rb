require "rails_helper"

describe User do
  it { should have_many(:pictures).through :tags }
  it { should have_many :tags }
end

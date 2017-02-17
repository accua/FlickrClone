require 'rails_helper'

describe Picture do
  it { should have_many :tags }
  it { should have_many :comments }
  it { should have_many(:users).through :comments }
end

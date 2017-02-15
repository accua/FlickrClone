require "rails_helper"

describe Tag do
  it { should belong_to :picture }
  it { should belong_to :user }
end

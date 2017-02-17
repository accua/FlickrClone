require 'rails_helper'

describe Comment do
  it { should belong_to :picture }
  it { should belong_to :user }
end

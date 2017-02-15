class TagsController < ActionController::Base
  before_filter :authenticate_user!

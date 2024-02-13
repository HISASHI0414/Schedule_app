class ApplicationController < ActionController::Base
  def current_user
    ActiveDecorator::Decorator.instance.decorate(super) if super.present?
    super
  end
  before_action :authenticate_user! #ログインした人しかできない
end

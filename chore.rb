class Chore
  attr_accessor :action, :object_or_setting

  def initialize(action, object_or_setting)
    @action = action
    @object_or_setting = object_or_setting
  end
end

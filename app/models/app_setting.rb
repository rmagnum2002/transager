class AppSetting < ActiveRecord::Base
  def chat_enabled?
    self.enable_chat == true
  end
end

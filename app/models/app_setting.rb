class AppSetting < ActiveRecord::Base
  def chat_enabled?
    self.enable_chat == true
  end

  def collapsing_header
    self.slider_option == true
  end
end

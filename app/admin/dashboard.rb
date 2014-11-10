ActiveAdmin.register_page "Dashboard" do

  # menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }
  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Settings" do
          ul do
            s = AppSetting.first
            li "Slider option: #{s.slider_option}"
            li "Map option: #{s.map_option}"
            li "Enable chat: #{s.enable_chat}"
            li "Include suppliers: #{s.include_suppliers}"
            li link_to 'Edit settings', edit_admin_app_setting_path(s)
          end
        end
      end

      column do
        panel "Info" do
          para "Total Parts: #{Part.count}"
          para "Total Pages: #{Page.count}"
          para "Total Contacts: #{Contact.count}"
        end
      end
    end
  end # content
end

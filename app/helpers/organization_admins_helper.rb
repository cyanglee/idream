module OrganizationAdminsHelper
  def translate_status(status)
    if status == Settings.status.pending
      I18n.t("ui.general.pending")
    elsif status == Settings.status.approved
      I18n.t("ui.general.approved")
    end
  end
end
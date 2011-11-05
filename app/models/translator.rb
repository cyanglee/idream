class Translator
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def gender
    if (@string == "male")
      I18n.t("ui.gender.male")
    else
      I18n.t("ui.gender.female")
    end
  end

  def education
    if (@string == "High School")
      I18n.t("ui.education.high_school")
    elsif (@string == "College")
      I18n.t("ui.education.college")
    elsif (@string == "Graduate School")
      I18n.t("ui.education.grad_school")
    else
      ""
    end
  end
end
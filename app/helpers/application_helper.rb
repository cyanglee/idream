# coding: utf-8
module ApplicationHelper

  def is_volunteer?
    current_user.try(:volunteer?)
  end

  def is_school_admin?
    current_user.try(:organization?)
  end

  def is_admin?
    current_user.try(:admin?)
  end

  def translate_status(status)
    if status == Settings.status.pending
      I18n.t("ui.general.pending")
    elsif status == Settings.status.approved
      I18n.t("ui.general.approved")
    end
  end

  # return a list of cities
  def cities_helper
    [
        ['基隆市', '基隆市'],
        ['台北市', '台北市'],
        ['新北市', '新北市'],
        ['桃園縣', '桃園縣'],
        ['新竹市', '新竹市'],
        ['新竹縣', '新竹縣'],
        ['苗栗縣', '苗栗縣'],
        ['台中市', '台中市'],
        ['彰化縣', '彰化縣'],
        ['南投縣', '南投縣'],
        ['雲林縣', '雲林縣'],
        ['嘉義市', '嘉義市'],
        ['嘉義縣', '嘉義縣'],
        ['台南市', '台南市'],
        ['高雄市', '高雄市'],
        ['屏東縣', '屏東縣'],
        ['台東縣', '台東縣'],
        ['花蓮縣', '花蓮縣'],
        ['宜蘭縣', '宜蘭縣'],
        ['澎湖縣', '澎湖縣'],
        ['金門縣', '金門縣'],
        ['連江縣', '連江縣']
    ]
  end

  # return a list of districts based on the selected city
  def districts_helper(city)
    districts =
        {
            "基隆市" => [
                ['仁愛區'],
                ['信義區'],
                ['中正區'],
                ['中山區'],
                ['安樂區'],
                ['暖暖區'],
                ['七堵區']
            ],
            "台北市" => [
                ['中正區'],
                ['大同區'],
                ['中山區'],
                ['松山區'],
                ['大安區'],
                ['萬華區'],
                ['信義區'],
                ['士林區'],
                ['北投區'],
                ['內湖區'],
                ['南港區'],
                ['文山區'],
            ]
        }
    districts["#{city}"]
  end
end

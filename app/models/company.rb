class Company < ApplicationRecord


  def haitou_rimawari
    return 100 * haitou / (kabuka * 100)  #配当利回りの計算
  end

  def eiri_ritu
    return 100 * eigyou_rieki / uriagedaka  #売上高営業利益率の計算
  end

end

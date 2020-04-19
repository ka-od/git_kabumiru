class Company < ApplicationRecord

  #メソッド：配当利回り
  def haitou_rimawari
    return 100 * haitou / (kabuka * 100)  if kabuka.present? && haitou.present?
  end

  #メソッド：売上高営業利益率の計算
  def eiri_ritu
    return 100 * eigyou_rieki / uriagedaka  if eigyou_rieki.present? && uriagedaka.present?
  end

end

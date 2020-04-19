class Company < ApplicationRecord

  #メソッド：配当利回り
  def haitou_rimawari
    return 100 * haitou / (kabuka * 100)  if haitou.present? && kabuka.present?
  end

  #メソッド：優待利回り
  def yuutai_rimawari
    return 100 * yuutai / (kabuka * 100)  if yuutai.present? && kabuka.present?
  end

  #メソッド：売上高営業利益率
  def eiri_ritu
    return 100 * eigyou_rieki / uriagedaka  if eigyou_rieki.present? && uriagedaka.present?
  end

end

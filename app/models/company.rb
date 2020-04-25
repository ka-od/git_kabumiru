class Company < ApplicationRecord

  #メソッド：売上高営業利益率
  def eiri_ritu
    return  (100 * eigyou_rieki / uriagedaka).round(1)                 if eigyou_rieki.present? && uriagedaka.present?
  end


  #メソッド：合計利回り
  def goukei_rimawari
    return  (haitou_rimawari + yutai_rimawari).round(2)                if haitou_rimawari.present? && yutai_rimawari.present?
  end
  
  
  #メソッド：割安度
  def wariyasudo
    return  ((1- kabuka / riron_kabuka) * 100).round(1)                if kabuka.present? && riron_kabuka.present?
  end


  #メソッド：優待株オススメ判定
  def yutai_hantei
    if haitou_rimawari.present? && yutai_rimawari.present?
      goukei_rimawari = haitou_rimawari + yutai_rimawari

      if kabuka.present? && riron_kabuka.present?
        wariyasudo = (1- kabuka / riron_kabuka) * 100

        if goukei_rimawari >= 4 && wariyasudo >= 25
          return  true
        end
      end
    end
  end


end

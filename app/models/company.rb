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



  #メソッド：1. 利回り判定
  def rimawari_hantei
    if goukei_rimawari.present?
      if goukei_rimawari >= 4
        return  true
      end
    end
  end
  
  #メソッド：2. 収益性判定
  def syuekisei_hantei
    if eiri_ritu.present?
      if eiri_ritu >= 10
        return  true
      end
    end
  end
  
  #メソッド：3. 割安度判定
  def wariyasudo_hantei
    if wariyasudo.present?
      if wariyasudo >= 25
        return  true
      end
    end
  end
  
  #メソッド：総合判定
  def sougou_hantei
    if rimawari_hantei && syuekisei_hantei && wariyasudo_hantei
      return  true
    end
  end


end

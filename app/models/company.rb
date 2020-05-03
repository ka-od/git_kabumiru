class Company < ApplicationRecord

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

class Company < ApplicationRecord


  def haitou_rimawari
    if :kabuka > 0
       return :haitou/:kabuka
    else
       return "エラー"
    end
  end

end

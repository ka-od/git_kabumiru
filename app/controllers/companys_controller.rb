class CompanysController < ApplicationController

  
  def index
    @company = Company.find(1)  #companyクラスから調べたいidに該当する銘柄情報をデータベースから取得。
    @haitou_rimawari = @company.haitou_rimawari #@companyというインスタンスにhaitou_rimawariというメソッドを使用。
  end



end

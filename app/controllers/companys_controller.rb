class CompanysController < ApplicationController


  def index
  end
  
  def show
    @company = Company.find(params[:id])  #companyクラスから調べたいidに該当する銘柄情報をデータベースから取得。
    @haitou_rimawari = @company.haitou_rimawari #@companyというインスタンスにhaitou_rimawariというメソッドを使用。
    @eiri_ritu = @company.eiri_ritu #@companyというインスタンスにeiri_rituというメソッドを使用。
  end

  def search
    # 検索フォームのキーワードをあいまい検索して、companysテーブルから銘柄情報を取得する
    @companys = Company.where('name LIKE(?)', "%#{params[:keyword]}%")
  end

end

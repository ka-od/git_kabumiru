class CompanysController < ApplicationController


  def index
  end
  
  def show
    @company = Company.find(params[:id])  #companyクラスから調べたいidに該当する銘柄情報をデータベースから取得。
    @eiri_ritu = @company.eiri_ritu
    @goukei_rimawari = @company.goukei_rimawari
    @wariyasudo = @company.wariyasudo
    @rimawari_hantei = @company.rimawari_hantei
    @syuekisei_hantei = @company.syuekisei_hantei
    @wariyasudo_hantei = @company.wariyasudo_hantei
    @sougou_hantei = @company.sougou_hantei
  end

  def search
    # 検索フォームのキーワードをあいまい検索して、companysテーブルから銘柄情報を取得する
    @companys = Company.where('name LIKE(?)', "%#{params[:keyword]}%").page(params[:page]).per(10)
  end

end

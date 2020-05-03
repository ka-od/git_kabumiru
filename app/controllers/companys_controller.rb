class CompanysController < ApplicationController


  def index
    @companys = Company.where('goukei_rimawari >= ? and eiri_ritu >= ? and wariyasudo >= ?', 0, 0, 0).page(params[:page]).per(10)
  end
  
  def show
    @company = Company.find(params[:id])
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

class Scraping
#require 'mechanize'

  #全銘柄情報をスクレイピングするメソッド
  def self.stock_info
    agent = Mechanize.new
    
    #companyクラスの全銘柄情報をデータベースから取得。
    @companys = Company.all

    #各銘柄情報をスクレイピング
    @companys.each do |com|
      meigara_page = agent.get("https://minkabu.jp/stock/#{com.id}")  #銘柄個別ページを読み込み
      elements = meigara_page.search('.md_ntab_stock .md_notice_mini.dpib')
      if elements.inner_text.include?("決算")         #決算情報のページ有無確認して、上場廃止銘柄などでのエラー停止を回避
        page = agent.get("https://minkabu.jp/stock/#{com.id}/settlement")
      
        name = page.at('.md_stockBoard_stockName').inner_text   if page.at('.md_stockBoard_stockName')
        uriagedaka = page.at('.ly_content_wrapper.size_ss .num.vamd').inner_text  if page.at('.ly_content_wrapper.size_ss .num.vamd')
    
        company = Company.where(id: com.id).first_or_initialize
        company.name = name
        company.uriagedaka = uriagedaka
        company.save
      else
        next
      end
    end   # "@companys.each" ここまで
  end   # "self.stock_info"　ここまで


end

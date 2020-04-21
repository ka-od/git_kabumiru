class Scraping
#require 'mechanize'

  #全銘柄情報をスクレイピングするメソッド
  def self.stock_info
    agent = Mechanize.new
    
    #companyクラスの全銘柄情報をデータベースから取得。
#    @companys = Company.all
    @companys = Company.find(1301, 1332)    #テスト用の記述

    #各銘柄情報をスクレイピング
    @companys.each do |com|
      meigara_page = agent.get("https://minkabu.jp/stock/#{com.id}")  #銘柄個別ページを読み込み
      elements = meigara_page.search('.md_ntab_stock .md_notice_mini.dpib')
      if elements.inner_text.include?("決算")         #決算情報のページ有無確認して、上場廃止銘柄などでのエラー停止を回避
        page = agent.get("https://minkabu.jp/stock/#{com.id}/settlement")
        
        #各項目についてスクレイピング。inner_textメソッドがnilではエラーとなるのでifで判定。
        #数字にカンマ区切りがあると値を正しく保存できないため、deleteメソッドで数字以外を削除。
        name = page.at('.md_stockBoard_stockName').inner_text   if page.at('.md_stockBoard_stockName')
        kabuka = page.search('.stock_price').inner_text.delete("^0-9").to_f / 10   if page.search('.stock_price')

        #決算情報の表から値をスクレイピング。
        tables = page.search('.data_table.md_table.is_fix tbody tr td')
        uriagedaka = tables[0].inner_text.delete("^0-9")   if tables
        eigyou_rieki = tables[1].inner_text.delete("^0-9")   if tables
        jun_rieki = tables[3].inner_text.delete("^0-9")   if tables
        hitokabu_rieki = tables[4].inner_text.delete("^0-9")   if tables

        #各項目をdbへ保存
        company = Company.where(id: com.id).first_or_initialize
        company.name = name
        company.kabuka = kabuka
        company.uriagedaka = uriagedaka
        company.eigyou_rieki = eigyou_rieki
        company.jun_rieki = jun_rieki
        company.hitokabu_rieki = hitokabu_rieki
        company.save
      else
        next
      end
    end   # "@companys.each" ここまで
  end   # "self.stock_info"　ここまで



end

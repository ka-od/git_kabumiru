class Scraping
#require 'mechanize'

  #全銘柄情報をスクレイピングするメソッド
  def self.stock_info
    agent = Mechanize.new
    
#    @companys = Company.all
    @companys = Company.find(1301, 1332)    #テスト用の記述

    @companys.each do |com|
      meigara_page = agent.get("https://minkabu.jp/stock/#{com.id}")  #銘柄ページを読み込み
      
      #銘柄ページからスクレイピング
      name = meigara_page.at('.md_stockBoard_stockName').inner_text   if meigara_page.at('.md_stockBoard_stockName')
      kabuka = meigara_page.search('.stock_price').inner_text.delete("^0-9").to_f / 10   if meigara_page.search('.stock_price')      

      company = Company.where(id: com.id).first_or_initialize
      company.name = name
      company.kabuka = kabuka

      
      menus = meigara_page.search('.md_ntab_stock .md_notice_mini.dpib')     #メニュータブの項目を抽出
      
      #決算情報ページからスクレイピング
      if menus.inner_text.include?("決算")
        kessan_page = agent.get("https://minkabu.jp/stock/#{com.id}/settlement")
        
        #決算情報の表から値をスクレイピング。
        tables = kessan_page.search('.data_table.md_table.is_fix tbody tr td')
        uriagedaka = tables[0].inner_text.delete("^0-9")   if tables
        eigyou_rieki = tables[1].inner_text.delete("^0-9")   if tables
        jun_rieki = tables[3].inner_text.delete("^0-9")   if tables
        hitokabu_rieki = tables[4].inner_text.delete("^0-9")   if tables

        company.uriagedaka = uriagedaka
        company.eigyou_rieki = eigyou_rieki
        company.jun_rieki = jun_rieki
        company.hitokabu_rieki = hitokabu_rieki
      end
      
      #株主優待ページからスクレイピング
      if menus.inner_text.include?("株主優待")
        yutai_page = agent.get("https://minkabu.jp/stock/#{com.id}/yutai")
        
        yutai = yutai_page.search('.tac.fwb.bglbl.lline.pbz span').inner_text.delete("^0-9")   if yutai_page.search('.tac.fwb.bglbl.lline.pbz span')
        haitou = yutai_page.search('.tac.fwb.bglbl.pbz.lline span').inner_text.delete("^0-9")   if yutai_page.search('.tac.fwb.bglbl.pbz.lline span')
        
        company.yutai = yutai
        company.haitou = haitou
      end

      company.save
    end   # "@companys.each" ここまで
  end   # "self.stock_info"　ここまで



end

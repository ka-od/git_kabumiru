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

      table_top = meigara_page.search('.ly_row.ly_gutters .ly_vamd dd')
      haitou_rimawari = table_top[3].inner_text.delete("^0-9").to_f / 100   if table_top
      pbr = table_top[7].inner_text.delete("^0-9").to_f / 100   if table_top

      company = Company.where(id: com.id).first_or_initialize
      company.name = name
      company.kabuka = kabuka
      company.haitou_rimawari = haitou_rimawari
      company.pbr = pbr

      
      menus = meigara_page.search('.md_ntab_stock .md_notice_mini.dpib')     #メニュータブの項目を抽出


      #株価予想ページからスクレイピング
      if menus.inner_text.include?("株価予想")
        analysis_page = agent.get("https://minkabu.jp/stock/#{com.id}/analysis")
        
        elements = analysis_page.search('.ly_col.ly_colsize_7_fix .fsxl.fwb')
        riron_kabuka = elements[0].inner_text.delete("^0-9").to_f   if elements
        
        company.riron_kabuka = riron_kabuka
      end

      #決算情報ページからスクレイピング
      if menus.inner_text.include?("決算")
        kessan_page = agent.get("https://minkabu.jp/stock/#{com.id}/settlement")
        
        table_kessan = kessan_page.search('.data_table.md_table td')
        uriagedaka = table_kessan[0].inner_text.delete("^0-9").to_f   if table_kessan
        eigyou_rieki = table_kessan[1].inner_text.delete("^0-9").to_f   if table_kessan
        jikoshihon_ritsu = table_kessan[23].inner_text   if table_kessan

        company.uriagedaka = uriagedaka
        company.eigyou_rieki = eigyou_rieki
        company.jikoshihon_ritsu = jikoshihon_ritsu
      end
      
      #株主優待ページからスクレイピング
      if menus.inner_text.include?("株主優待")
        yutai_page = agent.get("https://minkabu.jp/stock/#{com.id}/yutai")
        
        table_yutai = yutai_page.search('.md_table_wrapper span')
        yutai_rimawari = table_yutai[1].inner_text.delete("^0-9").to_f / 100   if table_yutai
        
        company.yutai_rimawari = yutai_rimawari
      end


      #演算
      eiri_ritu = (100 * eigyou_rieki / uriagedaka).round(1)                 if eigyou_rieki.present? && uriagedaka.present?
      goukei_rimawari = (haitou_rimawari + yutai_rimawari).round(2)                if haitou_rimawari.present? && yutai_rimawari.present?
      wariyasudo = ((1- kabuka / riron_kabuka) * 100).round(1)                if kabuka.present? && riron_kabuka.present?

      company.eiri_ritu = eiri_ritu
      company.goukei_rimawari = goukei_rimawari
      company.wariyasudo = wariyasudo
      
      company.save
    end   # "@companys.each" ここまで
  end   # "self.stock_info"　ここまで



end

class Scraping
#require 'mechanize'

  def self.stock_info
    agent = Mechanize.new
    
    @companys = Company.all  #companyクラスの銘柄情報をデータベースから取得。
    @companys.each do |com|
      puts com
      page = agent.get("https://minkabu.jp/stock/#{com.id}/settlement")
      name = page.search('.md_stockBoard_stockName').inner_text
      uriagedaka = page.at('.ly_content_wrapper.size_ss .num.vamd').inner_text
    
      company = Company.where(id: com.id).first_or_initialize
      company.name = name
      company.uriagedaka = uriagedaka
      company.save
    end
  end

end

class Scraping
#require 'mechanize'

  def self.stock_info
    agent = Mechanize.new
    
    num = 3401
    while num < 3403 do
      page = agent.get("https://minkabu.jp/stock/#{num}/settlement")
      name = page.search('.md_stockBoard_stockName').inner_text
      uriagedaka = page.at('.ly_content_wrapper.size_ss .num.vamd').inner_text
    
      company = Company.where(id: num).first_or_initialize
      company.name = name
      company.uriagedaka = uriagedaka
      company.save
      num = num + 1
    end
  end

end

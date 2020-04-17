class Scraping
#require 'mechanize'

  def self.uriagedaka
    agent = Mechanize.new
    page = agent.get("https://minkabu.jp/stock/3053/settlement")
    
    name = page.search('.md_stockBoard_stockName').inner_text
    uriagedaka = page.at('.ly_content_wrapper.size_ss .num.vamd').inner_text
    
    company = Company.new(name: name, uriagedaka: uriagedaka)
    company.save
  end

end

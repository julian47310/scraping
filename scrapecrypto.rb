
require 'rubygems'
require 'nokogiri'
require 'open-uri'




def cryptoarrayhash
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all"))
	hash = {}
	a = []
	for i in 1..200
		a << hash={page.xpath("/html/body/div/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[3]/div").text => page.xpath("/html/body/div/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[5]/a").text.gsub(/[^\d\.]/, '').to_f}
	end
	print a
end
cryptoarrayhash

require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

page1 = "http://annuaire-des-mairies.com/"
urls = page.xpath('//a[@class="lientxt"]/@href')
results = []
villesA = []
result = []
ville = ""
villesC = []
villesB = []
villeurls = []

#url's
urls.each do |url|
	  results << page1 + url.to_s.gsub("./","")
	  result << url.to_s.gsub("./","")
	villesA << url.to_s.gsub("./95/", "")
end

#town list
for i in (0..villesA.length)
	ville = villesA[i].to_s
	villesC << ville.gsub(".html", "")
	ville = villesC[i].to_s
	villesB << ville.gsub("-", " ")
end

#emailshash
mails = []
hash = Hash.new
emailsah = []
for i in (0..result.length)
	emails = Nokogiri::HTML(open("http://annuaire-des-mairies.com/#{result[i]}"))
	mails << emails.xpath('///html[1]/body[1]/div[1]/main[1]/section[2]/div[1]/table[1]/tbody[1]/tr[4]/td[2]').text
	emailsah << hash = {villesB[i] => mails[i]}
end
puts"
>voici les adresses emails des mairies des villes du val d'oise
"
print emailsah

#townurlhash
hash = Hash.new
villeurls = []
for i in (0..results.length)
	villeurls << hash = {villesB[i] => results[i]}
end
puts"

>voici les url des sites des villes du val d'oise
"
print villeurls[0..villeurls.length-2]

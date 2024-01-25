require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'net/http'
require 'rspec'

def get_townhall_urls
    html = URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html")
    page = Nokogiri::HTML(html)
    townhall_url = page.xpath('//p/a/@href').map(&:text)
    full_url = townhall_url.map {|url| "https://www.annuaire-des-mairies.com"+ url[1..-1]}
end

def get_townhall_email(full_url)
    cities = []
    emails = []
    full_url.each do |url|
         html = URI.open("#{url}")
         page = Nokogiri::HTML(html)
         city = page.xpath('//a[contains(@class, "lientxt4")]')[0].text
         cities.push(city)
         townhall_email = page.xpath('//tr[contains(@class,"txt-primary tr-last")]//td')[7].text
         emails.push(townhall_email)
    end
    mails = Hash[cities.zip(emails)]
    a = []
    mails.each {|key, value| a << {key => value} }
    puts a 
end


def perform
    full_url = get_townhall_urls
    get_townhall_email(full_url)
end

perform
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'net/http'

html = URI.open("https://coinmarketcap.com/all/views/all/")

page = Nokogiri::HTML(html)
puts page.class 

crypto_names = page.xpath('//*[contains(@class,"cmc-table__column-name--name cmc-link")]').map(&:text)

crypto_value = page.xpath('//*[contains(@class,"sc-a0353bbc-0 gDrtaY")]').map(&:text)

crypto = Hash[crypto_names.zip(crypto_value)]

a = []
crypto.each {|key, value| a << {key => value} }
puts a

require 'rubygems'
require 'mechanize'

agent = Mechanize.new
page = agent.get('http://ghostism.co.kr/mystery')

title = page.search('#bd_lst > tbody > tr:nth-child(2) > td.title > a.hx').map(&:text)

puts title
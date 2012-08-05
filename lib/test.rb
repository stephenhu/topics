#require "mysql"
#require "sequel"
require "sinatra"

#DB = Sequel.connect(
#  :adapter  => 'mysql',
#  :user     => 'topics',
#  :host     => '127.0.0.1',
#  :database => 'topics',
#  :password => 'cloudf1'
#)

#users = DB[:users]

#users.each{|row| p row}

get "/" do
  puts "hello"
end

get "/world/details/?" do
  puts "world"
  puts params[:period]
  puts params[:period].split(",").count
end


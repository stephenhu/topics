require "haml"
require "mysql"
require "sequel"
require "sinatra"


DB = Sequel.connect(
  :adapter  => 'mysql',
  :user     => 'topics',
  :host     => '127.0.0.1',
  :database => 'topics',
  :password => 'cloudf1'
)

#users = DB[:users]

#users.each{|row| p row}

get "/" do
  haml :index
end

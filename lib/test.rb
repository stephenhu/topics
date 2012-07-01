require "mysql"
require "sequel"

DB = Sequel.connect(
  :adapter  => 'mysql',
  :user     => 'topics',
  :host     => '127.0.0.1',
  :database => 'topics',
  :password => 'cloudf1'
)

#users = DB[:users]

#users.each{|row| p row}


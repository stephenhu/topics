require "mysql"
require "sequel"

DB = Sequel.connect(
  :adapter  => 'mysql',
  :user     => 'top',
  :host     => '127.0.0.1',
  :database => 'top',
  :password => 'cloudf1'
)

#users = DB[:users]

#users.each{|row| p row}


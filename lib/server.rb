require "haml"
require "mysql"
require "active_record"
require "sinatra"

Dir.glob("./models/*").each { |r| require r }

@config = YAML.load_file('/home/hu/projects/topics/config/database.yml')['development']

ActiveRecord::Base.establish_connection @config

get "/" do
  
  #u = User.new( email: "goodruck@gmail.com" )
  #u.save!

  #@users = User.all
  
  #puts @users
  
  @topics = Topic.all

  #puts @topics.length.to_s
  haml :index, :locals => { :topics => @topics }
  #haml :index
end

require "haml"
require "mysql"
require "active_record"
require "sinatra"
require "sinatra/cookies"

Dir.glob("./models/*").each { |r| require r }

@config =
  YAML.load_file('/home/hu/projects/topics/config/database.yml')['development']

ActiveRecord::Base.establish_connection @config


get "/" do
  
  @topics = Topic.all

  haml :index, :locals => { :topics => @topics }
 
end

get "/tags/:tagname" do

  @ts = Topic.joins(:tags).where('tags.tag' => params[:tagname])
  haml :tags, :locals => { :tag => params[:tagname], :tags => @ts }

end

get "/topics/:topicid" do

  @topic = Topic.joins(:tags).where('id' => params[:topicid]).first
  haml :topics, :locals => { :topic => @topic }

end

get "/users/:name" do

  @user = User.where(:uuid => params[:name]).first

  #TODO: check null
  haml :users, :locals => { :user => @user } 

end

get "/getcookie" do
  
  puts request.cookies["topics"]

end

get "/setcookie" do
  response.set_cookie( "topics", "secret" )
end

get "/test/:email" do

  u = User.new( :email => params[:email] )
  u.save

end


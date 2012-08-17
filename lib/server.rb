require "haml"
require "mysql"
require "active_record"
require "sinatra"
require "sinatra/cookies"

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

get "/tags/:tagname" do

  # get all topics for the tag
  #puts Topic.all.each { |t| puts t.tags.length }
  @ts = Topic.joins(:tags).where( 'tags.tag' => params[:tagname] )
  haml :tags, :locals => { :tag => params[:tagname], :tags => @ts }

end

get "/topics/:topicid" do

  @topic = Topic.joins(:tags).where( 'id' => params[:topicid] ).first
  haml :topics, :locals => { :topic => @topic }

end

get "/getcookie" do
  
  puts request.cookies["topics"]

end

get "/setcookie" do
  response.set_cookie( "topics", "fuck you" )
end


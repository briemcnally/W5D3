require 'rack'

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  res['Content-Type'] = 'text/html'
  res.write("#{req.path}")
  res.finish

end

# this is creating an app that we could give to Rack to return Hello World!
#response and request classes to provide a friendlier API
#setting 'Content-Type' tells the browser what the server has given to it in response
#to put things into the res body user Rack::Response#write
#class Rack::Response#finish when teh res is finished

Rack::Server.start(
  app: app,
  Port: 3000
)

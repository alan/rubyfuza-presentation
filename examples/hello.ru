#\ -w -p 8765

class DoNothingMiddleware
  def initialize(app)
    @app = app
    @counter = 0
  end

  def call(env)
    # Change the headers if needed before going to the next middleware 
    code, headers, body = @app.call(env)
    # Change response if needed
    [code, headers, body]
  end
end

use DoNothingMiddleware
app = lambda{|env| [200, {"Content-Type" => 'text/plain'}, 'Hello World']}
run app
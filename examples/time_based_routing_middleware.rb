class TimeBasedRoutingMiddleware
  BETA = Time.parse("2011-05-01T00:00:00Z")
  PATH = 'PATH_INFO'
  def initialize(app, options={})
    @app, @options = app, options
  end

  def call(env)
    if env["PATH_INFO"] != "/"
      @app.call(env)
    elsif Time.now < BETA
      @app.call(env.merge(PATH => '/beta'))
    else
      @app.call(env.merge(PATH => '/beta2'))
    end
  end
end
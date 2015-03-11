module SinatraApp

  class AsyncCallbackWrapper

    class Callback
      attr_reader :status, :headers, :body

      def call(args)
        @status, @headers, @body = args
      end
    end

    def initialize(app, options={})
      @app = app
    end

    def call(env)
      callback = Callback.new
      env.merge! 'async.callback' => callback

      catch(:async) do
        @app.call(env)
      end

      [callback.status, callback.headers, callback.body]
    end
  end

end
module ThinPosts
  class IndexCommand

    def initialize(params, dispatcher)
      @params = params
      @dispatcher = dispatcher
    end

    def execute()
      @thin_posts = ThinPost.all

      dispatcher.dispatch(:success, thin_posts: @thin_posts)
    end

    private

    attr_reader :params,
      :dispatcher
  end
end

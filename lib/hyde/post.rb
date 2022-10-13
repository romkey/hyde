class Hyde < Thor
  class Post < Thor::Group
    include Thor::Actions

    def init(title)
      @title = title
    end

    def draft
    end

    def publish
    end
  end
end


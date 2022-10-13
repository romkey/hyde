require 'thor'

class Hyde < Thor
  class Publish < Thor::Group
    include Thor::Actions
    include Hyde::Helpers

    argument :file, required: true, type: :string

    def init
      init_helper_filename(file)
    end

    def create_image_directory
      `/bin/mkdir -p #{published_assets_path}`
    end

    def move_post
      File.open(published_article_path, 'w') do |output|
        File.readlines(draft_article_path).each do |line|
          line.gsub!("permalink: /#{draft_article_path}/", "permalink: /#{year}/#{month}/#{day}/#{published_article_path}/")
          line.gsub!("image: /#{draft_image_path}", "image: /#{published_image_path}")
          line.gsub!("teaser: /#{draft_teaser_path}", "teaser: /#{published_teaser_path}")

          output.puts(line)
        end
      end

      `/bin/rm #{draft_article_path}`
    end

    def move_images
      `/bin/mv #{draft_image_path} #{published_image_path}`
      `/bin/mv #{draft_teaser_path} #{published_teaser_path}`
    end

    def remove_draft_image_directory
      `/bin/rmdir #{draft_assets_path}`
    end
  end
end

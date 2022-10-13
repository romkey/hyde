require 'thor'
require 'fileutils'

class Publish < Thor::Group
  include Thor::Actions
  include Hyde::Helpers

  argument :file, required: true, type: :string

  def init
    init_helper_filename(file)
  end

  def create_image_directory
    FileUtils.mkdir_p published_assets_path
  end

  def move_post
    File.open(published_article_path, 'w') do |output|
      File.readlines(draft_article_path).each do |line|
        line.gsub!("permalink: /drafts/", "permalink: /#{year}/#{month}/#{day}/#{slug}.md/")
        line.gsub!("image: /#{draft_image_path}", "image: /#{published_image_path}")
        line.gsub!("teaser: /#{draft_teaser_path}", "teaser: /#{published_teaser_path}")

        output.puts(line)
      end
    end

    FileUtils.rm draft_article_path
  end

  def create_teaser
    puts 'checking teaser'

    if FileUtils.identical? draft_image_path, 'assets/images/test-pattern.jpg'
      puts 'Article image is test pattern, remember to update it'
      return
    end

    if !FileUtils.identical? draft_teaser_path, 'assets/images/test-pattern-teaser.jpg'
      puts 'not updating teaser image'
      return
    end

    puts 'rebuilding teaser'
    `convert #{draft_image_path} -resize 200x124\^ -gravity Center -extent 200x124 #{draft_teaser_path}`
  end

  def move_images
    FileUtils.mv [ draft_image_path, draft_teaser_path ], published_assets_path
  end

  def remove_draft_image_directory
    FileUtils.rm_r draft_assets_path
  end
end

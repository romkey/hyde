require 'thor'
require 'date'

class Hyde < Thor
  module Helpers
    attr_reader :title, :slug
    attr_reader :draft_article_path, :draft_assets_path, :draft_image_path, :draft_teaser_path
    attr_reader :published_article_path, :published_assets_path, :published_image_path, :published_teaser_path
    attr_reader :year, :month, :day

    def init_helper(title)
      @slug = title.downcase
      _finish_init
    end

    def init_helper_filename(filename)
      unless filename.match /^_drafts\//
        raise 'Must provide filename in _drafts folder'
      end

      @slug = filename.gsub /^_drafts\//, ''
      @slug.gsub! /\.md$/, ''

      _finish_init      
    end

private
    def _finish_init
      @slug.gsub! ' ', '-'

      %w[the a an].each do |word|
        slug.gsub! "-#{word}-", '-'
      end

      d = Time.now.to_date
      @year = d.year
      @month = d.strftime("%m")
      @day = d.strftime("%d")

      @draft_article_path = "_drafts/#{slug}.md"
      @draft_assets_path = "assets/images/drafts/#{@slug}"
      @draft_image_path = "#{@draft_assets_path}/#{@slug}.jpg"
      @draft_teaser_path = "#{@draft_assets_path}/#{@slug}-teaser.jpg"

      @published_article_path = "_posts/#{@year}-#{@month}-#{@day}-#{@slug}.md"
      @published_assets_path = "assets/images/#{@year}-#{@month}-#{@day}-#{@slug}"
      @published_image_path = "#{@published_assets_path}/#{slug}.jpg"
      @published_teaser_path = "#{@published_assets_path}/#{slug}-teaser.jpg"

    end
  end
end


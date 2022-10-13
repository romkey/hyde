require 'thor'
require 'date'

class Hyde < Thor
  module Helpers
    attr_reader :title, :slug, :draft
    attr_reader :draft_article_path, :draft_assets_path, :draft_image_path, :draft_teaser_path
    attr_reader :published_article_path, :published_assets_path, :published_image_path, :published_teaser_path
    attr_reader :year, :month, :day

    def init_helper(title)
      @draft = true

      @slug = Hyde::Helpers.slugify title

      _finish_init
    end

    def init_helper_filename(filename)
      unless filename.match(/^_drafts\//) || filename.match(/^_posts\//)
        raise 'Must provide filename in _drafts or _posts folder'
      end

      @filename = filename

      if filename.match /^_drafts\//
        @draft = true
        @slug = filename.gsub(/^_drafts\//, '')
      else
        @draft = false
        @slug = filename.gsub(/^_posts\//, '')
      end

      @slug.gsub!(/\.md$/, '')

      _finish_init      
    end

    def self.slugify(title)
      slug = title.downcase

      slug.gsub! /[^a-z|A-Z|0-9| ]/, ''

      slug.gsub! ' ', '-'

      %w[the a an].each do |word|
        slug.gsub! /^#{word}-/, ''
        slug.gsub! "-#{word}-", '-'
        slug.gsub! /-#{word}$/, ''
      end

      return slug
    end

private
    def _finish_init
      if @draft
        d = Time.now.to_date
        @year = d.year
        @month = d.strftime("%m")
        @day = d.strftime("%d")
      else
        m = @filename.match /(\d\d\d\d)-(\d\d)-(\d\d)-([\w\-]+)\.md/
        pp m
        @year = m[1]
        @month = m[2]
        @day = m[3]
        @slug = m[4]
      end

      @draft_article_path = "_drafts/#{slug}.md"
      @draft_assets_path = "assets/images/drafts/#{@slug}"
      @draft_image_path = "#{@draft_assets_path}/#{@slug}.jpg"
      @draft_teaser_path = "#{@draft_assets_path}/#{@slug}-teaser.jpg"

      if draft
        @published_article_path = "_posts/#{@year}-#{@month}-#{@day}-#{@slug}.md"
        @published_assets_path = "assets/images/#{@year}/#{@month}/#{@day}/#{@slug}"
        @published_image_path = "#{@published_assets_path}/#{slug}.jpg"
        @published_teaser_path = "#{@published_assets_path}/#{slug}-teaser.jpg"
      else
        @published_article_path = "_posts/#{@year}-#{@month}-#{@day}-#{@slug}.md"
        @published_assets_path = "assets/images/#{@year}/#{@month}/#{@day}/#{@slug}"
        @published_image_path = "#{@published_assets_path}/#{slug}.jpg"
        @published_teaser_path = "#{@published_assets_path}/#{slug}-teaser.jpg"
      end
    end
  end
end


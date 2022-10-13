require 'thor'
require 'fileutils'

require 'hyde/helpers'

class Draft < Thor::Group
  include Thor::Actions
  include Hyde::Helpers

  argument :title, required: true, type: :string

  def init
    init_helper(title)
  end

  def create_draft
    File.open(draft_article_path, 'w') do |f|
      f.write <<END_OF_TRANSMISSION
---
title: "#{title}"
author: John Romkey
layout: single
permalink: /drafts/#{slug}/
excerpt: 
header:
  image: /#{draft_image_path}
  teaser: /#{draft_teaser_path}
categories:
    - Software
tags:
    - stars
    - garters
---
END_OF_TRANSMISSION
    end
  end

  def create_image_directory
    FileUtils.mkdir(draft_assets_path)
  end

  def create_image
    FileUtils.cp 'assets/images/test-pattern.jpg', draft_image_path
  end

  def create_teaser
    FileUtils.cp 'assets/images/test-pattern-teaser.jpg', draft_teaser_path
  end
end



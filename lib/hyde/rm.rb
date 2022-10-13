require 'thor'
require 'fileutils'

require 'hyde/helpers'

class Rm < Thor::Group
  include Thor::Actions
  include Hyde::Helpers

  argument :file, required: true, type: :string

  def init
    init_helper_filename(file)
  end

  def remove_article
    if draft
      FileUtils.rm draft_article_path
    else
      FileUtils.rm published_article_path
    end
  end

  def remove_images
    if draft
      FileUtils.rm_r draft_assets_path
    else
      FileUtils.rm_r published_assets_path
    end
  end
end



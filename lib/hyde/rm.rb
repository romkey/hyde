require 'thor'
require 'hyde/helpers'

class Hyde < Thor
  class Rm < Thor::Group
    include Thor::Actions
    include Hyde::Helpers

    argument :file, required: true, type: :string

    def init
      init_helper_filename(file)
    end

    def remove_draft
      `/bin/rm #{draft_article_path}`
    end

    def remove_images
      `/bin/rm -rf #{draft_assets_path}`
    end
  end
end



require 'thor'

require 'hyde/draft'
require 'hyde/publish'
require 'hyde/rm'

class Hyde < Thor
  register Draft, 'draft', 'draft TITLE', 'Generate a new draft entitled TITLE'

  register Publish, 'publish', 'publish FILENAME', 'Publish the draft contained in FILENAME'

  register Rm, 'rm', 'rm FILENAME', 'Remove the draft contained in FILENAME'

  def self.exit_on_failure?
    true
  end
end

require 'logger'

require 'chefsearch/version'
require 'chefsearch/search'
require 'chefsearch/errors'

###
#
# ChefSearch searches a Chef server via CLI or API
# given a role, name, or Chef environment
module ChefSearch
  def self.logger
    @logger ||= Logger.new(STDOUT).tap do |l|
      l.level = Logger::INFO
    end
  end
end

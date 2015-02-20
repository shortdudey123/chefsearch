require 'chef'

module ChefSearch
  ###
  #
  # Implements the searching
  #
  class Search
    FILTER_RESULT = { name: ['name'] }

    def initialize(config = nil)
      @config_filename = config
      @chef_config = load_config
    end

    def search(opts = {})
      name = opts.fetch(:name, '*')
      role = opts.fetch(:role, '*')
      chef_environment = opts.fetch(:chef_environment, '*')

      query = build_query(name, role, chef_environment)
      ChefSearch.logger.debug { query }

      results = Chef::Search::Query.new.search(:node,
                                               query,
                                               filter_result: FILTER_RESULT
                                               )
      parse_results(results)
    end

    private

    def build_query(name, role, chef_environment)
      name = '*' if name.nil?
      role = '*' if role.nil?
      chef_environment = '*' if chef_environment.nil?

      "name:#{name} AND "\
      "role:#{role} AND "\
      "chef_environment:#{chef_environment}"
    end

    def load_config
      # try default places since no name was passed
      if @config_filename.nil?
        filepath = find_config_file
      # name was passed, use it
      else
        f_given = File.expand_path(@config_filename)
        fail(FileNotFoundError, "#{f_given} does not exist!") unless
          File.exist?(f_given)
        filepath = f_given
      end

      ChefSearch.logger.debug { filepath }

      Chef::Config.from_file(filepath)
    end

    def find_config_file
      f_local = File.join(File.dirname(__FILE__), '.chef', 'knife.rb')
      f_home = File.join(Etc.getpwuid.dir, '.chef', 'knife.rb')

      if File.exist?(f_local)
        filepath = f_local
      elsif File.exist?(f_home)
        filepath = f_home
      else
        abort('Unable to file a Chef config.  Please speficy its path.')
      end

      filepath
    end

    def parse_results(results)
      results_ret = []

      return results_ret if results[0].empty?

      results[0].each do |r|
        results_ret.push(r['data']['name'])
      end

      results_ret.sort!

      ChefSearch.logger.debug { results_ret }

      results_ret
    end
  end
end

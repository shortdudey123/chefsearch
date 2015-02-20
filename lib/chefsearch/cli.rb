require 'trollop'

module ChefSearch
  ###
  # CLI execution
  #
  class CLI
    attr_reader :opts

    # setup CLI options
    def initialize(argv, stdin = STDIN, stdout = STDOUT, stderr = STDERR,
      kernel = Kernel)
      @argv, @stdin, @stdout, @stderr, @kernel = argv, stdin, stdout,
                                                 stderr, kernel
    end

    # Run the CLI command
    def execute!
      parse_options

      c = ChefSearch::Search.new(@opts.config)
      puts c.search(name: @opts.name,
                    role: @opts.role,
                    chef_environment: @opts.environment
                    )
    end

    private

    def parse_options
      @opts = Trollop.options(@argv) do
        banner 'Usage: ChefSearch [options]'
        version(ChefSearch::VERSION)

        banner ''
        banner 'Options:'
        opt :name, 'Node name', type: :string
        opt :role, 'Chef role', type: :string
        opt :environment, 'Chef environment', type: :string
        opt :config, 'Chef knife config filepath', type: :string
      end
    end
  end
end

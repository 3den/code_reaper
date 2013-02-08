module CodeReaper
  class Directory
    attr_reader :dirname, :files

    def initialize(dirname, options={}, input = ::Dir)
      unless input.exist?(dirname)
        raise InvalidDirectory, dirname
      end

      @dirname = dirname
      load_files options
    end

    def strip regex
      files.map do |file|
        striped = File.new(file).strip regex
        block_given? ? yield(striped) : striped
      end
    end

    private

    def strip_file file, regex
      File.new(file).strip regex
    end

    def load_files options={}
      @files = Dir["#{dirname}/**/**"]
      select_files options[:only]
      reject_files options[:except]
    end

    def select_files(regex)
      return files unless regex
      files.select! { |file| file =~ regex }
    end

    def reject_files(regex)
      return files unless regex
      files.reject! { |file| file =~ regex }
    end
  end

  InvalidDirectory = Class.new(ArgumentError)
end


module CodeReaper
  class Directory
    attr_reader :dirname, :files

    def initialize(dirname, options={})
      unless ::File.directory?(dirname)
        raise InvalidDirectory, dirname
      end

      @dirname = dirname
      load_files options
    end

    def strip regex
      files.map do |file|
        striped = File.new(file).strip regex
        block_given? ? yield(file, striped) : striped
      end
    end

    private

    def strip_file file, regex
      File.new(file).strip regex
    end

    def load_files options={}
      @files = ::Dir["#{dirname}/**/**"]
      select_files options[:only]
      reject_files options[:except]
    end

    def select_files(regex)
      files.select! { |file| ::File.file? file }
      files.select! { |file| file =~ regex } if regex
    end

    def reject_files(regex)
      files.reject! { |file| file =~ regex } if regex
    end
  end

  InvalidDirectory = Class.new(ArgumentError)
end


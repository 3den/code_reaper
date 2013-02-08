module CodeReaper
  class File
    attr_reader :file, :filename

    def initialize(filename, input = ::File)
      unless input.file?(filename)
        raise InvalidFile, filename
      end

      @filename = filename
      @file = input.read filename
    end

    def strip(regex)
      striped = Strip.new(file).strip regex

      block_given? ? yield(striped) : striped
    end
  end

  InvalidFile = Class.new(ArgumentError)
end

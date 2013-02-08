module CodeReaper
  class Strip
    attr_reader :str

    STRIP_REGEX = {
      erb: /\<\%(.*?)\%\>/,
      handlebars: /\{\{(.*?)\}\}/
    }

    def initialize str
      @str = str
    end

    def strip regex
      str.gsub filter(regex), ''
    end

    STRIP_REGEX.keys.each do |key|
      define_method "strip_#{key}" do
        strip key
      end
    end

    private

    def filter regex
      regex.is_a?(Symbol) ? STRIP_REGEX[regex] : regex
    end
  end
end

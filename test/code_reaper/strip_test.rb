require File.expand_path('../../test_helper', __FILE__)

module CodeReaper
  describe Strip do
    describe "#strip" do
      it "removes all erb tags" do
        code = "my code<% if true %><%= \"hello\" %><% end %>"
        reaper = Strip.new(code)

        reaper.strip_erb.must_equal "my code"
      end

      it "removes all handlebars tags" do
        code = "my code{{ variable }}"
        reaper = Strip.new(code)

        reaper.strip_handlebars.must_equal "my code"
      end

      it "removes a custom regex" do
        code = "my code 123"
        reaper = Strip.new(code)

        reaper.strip(/\D|\s/).must_equal "123"
      end

      it "removes a custom string" do
        code = "my code 123"
        reaper = Strip.new(code)

        reaper.strip("123").must_equal "my code "
      end

      it "does nothing if there are no matching tags" do
        code = "my code{{ variable }}"
        reaper = Strip.new(code)

        reaper.strip_erb.must_equal "my code{{ variable }}"
      end
    end
  end
end

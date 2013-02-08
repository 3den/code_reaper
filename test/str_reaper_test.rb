require "minitest/autorun"

describe StrReaper do
  describe "#strip" do
    it "removes all erb tags" do
      code = "my code<% if true %><%= \"hello\" %><% end %>"
      reaper = StrReaper.new(code)
      reaper.strip_erb.must_equal "my code"
    end

    it "removes all handlebars tags" do
      code = "my code{{ variable }}"
      reaper = StrReaper.new(code)
      reaper.strip_handlebars.must_equal "my code"
    end
  end
end

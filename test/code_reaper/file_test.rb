require File.expand_path('../../test_helper', __FILE__)

module CodeReaper
  describe File do
    describe "#strip" do
      it "removes all erb code from a file" do
        reaper = File.new("#{FIXTURE_PATH}index.html.erb")
        striped = ::File.read("#{FIXTURE_PATH}index.html")
        reaper.strip(:erb).must_equal striped
      end

      it "does nothing if there is nothing to remove" do
        reaper = File.new("#{FIXTURE_PATH}index.html")
        striped = ::File.read("#{FIXTURE_PATH}index.html")
        reaper.strip(:erb).must_equal striped
      end

      it "acepts a block to interact with the stripec content" do
        reaper = File.new("#{FIXTURE_PATH}index.html.erb")
        striped = reaper.strip :erb do |text|
          Strip.new(text).strip /\<p\>(.*)\<\/p\>/
        end

        striped.wont_include "<p>"
        striped.must_include "<table>"
      end
    end
  end
end

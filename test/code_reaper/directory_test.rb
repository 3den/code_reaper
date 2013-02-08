require File.expand_path('../../test_helper', __FILE__)

module CodeReaper
  describe Directory do
    describe "#strip" do
      it "removes all erb code from a file" do
        reaper = Directory.new(FIXTURE_PATH)
        striped = ::File.read("#{FIXTURE_PATH}index.html")
        reaper.strip(:erb).must_equal [striped, striped]
      end
    end
  end
end

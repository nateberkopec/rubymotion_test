class ApplicationTest < MiniTest::Unit::TestCase

  def setup
    @app = UIApplication.sharedApplication
  end

  def test_has_two_windows
    assert_equal 2, @app.windows.size
  end
end

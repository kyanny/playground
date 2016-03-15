require 'test/unit'

class BomTest < Test::Unit::TestCase
  def test_nobom
    text = File.read("nobom.txt").chomp
    text.sub!(/\A\uFEFF/, "")
    assert_equal("Hello,World!", text)
  end
end

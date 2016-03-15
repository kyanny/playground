require 'test/unit'

class BomTest < Test::Unit::TestCase
  def test_bom
    assert_equal("Hello,World!", File.read("bom.txt").chomp)
  end

  def test_nobom
    assert_equal("Hello,World!", File.read("nobom.txt").chomp)
  end
end

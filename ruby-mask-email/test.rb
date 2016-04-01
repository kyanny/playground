require 'test/unit'

def mask_email email
  email.sub(/\A([^@]+)@/) do
    ("*" * $1.length) + "@"
  end
end

class MaskEmailTest < Test::Unit::TestCase
  def test_1
    puts mask_email("kensuke@quipper.com")
    assert mask_email("kensuke@quipper.com"), "*******@quipper.com"
  end

  def test_2
    puts mask_email("kensuke@quipper.com_WITHDRAWN_1")
    assert mask_email("kensuke@quipper.com_WITHDRAWN_1"), "*******@quipper.com_WITHDRAWN_1"
  end
end

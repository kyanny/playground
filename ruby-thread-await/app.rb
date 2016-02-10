require 'test/unit'

def main
  m = Mutex.new
  a = []
  count = 10
  t1 = Thread.new do
    # これじゃダメ
    Thread.list.tap { |list|
      list.delete Thread.current
      list.delete Thread.main
      list.each(&:join)
    }
    # スレッド t2 が作られる前にここに来てしまうと t1 が先に完走してしまう。
    # 下のテストを何度か走らせたところ、だいたい 99.98% くらいの pass 率になるようだ。
    # 0.02% くらいの確率で失敗する。1万回に2回程度？
    m.synchronize {
      a << 'Finished.'
    }
  end

  t2 = Thread.new do
    count.times do |i|
      m.synchronize {
        a << "Count #{i}"
      }
    end
  end

  t1.join
  t2.join

  a
end

class TestApp < Test::Unit::TestCase
  10.times do |n|
    10000.times do |m|
      define_method "test_app_#{n}_#{m}" do
        res = main
        assert_equal ["Count 0", "Count 1", "Count 2", "Count 3", "Count 4", "Count 5", "Count 6", "Count 7", "Count 8", "Count 9", "Finished."], res
      end
    end
  end
end

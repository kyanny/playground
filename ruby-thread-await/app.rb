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

def main2
  m = Mutex.new
  cv = ConditionVariable.new
  a = []
  count = 10
  t1 = Thread.new do
    m.synchronize {
      cv.wait(m) if a.length.zero?
      a << 'Finished.'
    }
  end

  t2 = Thread.new do
    count.times do |i|
      m.synchronize {
        a << "Count #{i}"
      }
    end
    cv.signal
  end

  # sleep(0.01) while Thread.list.any?(&:alive?)
  t1.join
  t2.join

  a
end

def main3
  m = Monitor.new
  cv = m.new_cond
  a = []
  count = 10
  t1 = Thread.new do
    m.synchronize {
      p Thread.list
      cv.wait
      a << 'Finished.'
    }
  end

  t2 = Thread.new do
    m.synchronize {
      p Thread.list
      count.times do |i|
        a << "Count #{i}"
      end
    }
    cv.signal
  end

  t1.join
  t2.join

  a
end

def main4
  m = Mutex.new
  cv = ConditionVariable.new
  a = []
  t1 = Thread.new {
    m.synchronize {
      cv.wait(m)
      a << '1'
    }
  }
  t2 = Thread.new {
    5.times do
      m.synchronize {
        a << '0'
      }
    end
    cv.broadcast
  }
  t1.join
  t2.join
  a
end

class TestApp < Test::Unit::TestCase
  def self.make_test fn, proc, num, expected
    num.times do |n|
      define_method "test_#{fn}_#{n}" do
        assert_equal expected, proc.call
      end
    end
  end
  # 10.times do |n|
  #   10000.times do |m|
  #     define_method "test_main3_#{n}_#{m}" do
  #       assert_equal ["Count 0", "Count 1", "Count 2", "Count 3", "Count 4", "Count 5", "Count 6", "Count 7", "Count 8", "Count 9", "Finished."], main3
  #     end
  #   end
  # end

  # 10.times do |n|
  #   10000.times do |m|
  #     define_method "test_main_#{n}_#{m}" do
  #       assert_equal ["Count 0", "Count 1", "Count 2", "Count 3", "Count 4", "Count 5", "Count 6", "Count 7", "Count 8", "Count 9", "Finished."], main
  #     end
  #   end
  # end

  # 10.times do |n|
  #   10000.times do |m|
  #     define_method "test_main2_#{n}_#{m}" do
  #       assert_equal ["Count 0", "Count 1", "Count 2", "Count 3", "Count 4", "Count 5", "Count 6", "Count 7", "Count 8", "Count 9", "Finished."], main2
  #     end
  #   end
  # end

  # 10.times do |n|
  #   10000.times do |m|
  #     define_method "test_main3_#{n}_#{m}" do
  #       assert_equal ["Count 0", "Count 1", "Count 2", "Count 3", "Count 4", "Count 5", "Count 6", "Count 7", "Count 8", "Count 9", "Finished."], main3
  #     end
  #   end
  # end

  make_test "main4", Proc.new { main4 }, 10000, ["1", "0", "0", "0", "0"]
end

class Executors
  def self.new_fixed_thread_pool(max_threads)
    ThreadPoolExecutor.new(max_threads)
  end

  class ThreadPoolExecutor
    def initialize(max_threads)
        @max_threads = max_threads
    end

    def execute(task:)
      loop do
        if Thread.list.select {|t| t[:pool_id] == self.object_id }.count < @max_threads
          return Thread.new do
            task.run
          end.tap {|t| t[:pool_id] = self.object_id }
        end
      end
    end
  end
end

class Message
  Finish = :end
end

class Num < Message
  def initialize(i)
    @i = i
  end
  def to_i
    @i
  end
end

class FinishFlag
  def finish_flag?
    true
  end
end

RESULT = []

class Writer
  def initialize(queue)
    @queue = queue
  end

  def run
    loop do
      data = @queue.pop()
      if data == Message::Finish
        @queue.push data
        break
      end
      write(data)
    end
  end

  def write(data)
    sleep(1)
    RESULT << data.to_i * 2
  end
end

queue = SizedQueue.new(1000)

class Reader
  def initialize(queue)
    @queue = queue
  end

  def run
    (1..10).each do |i|
      @queue.push Num.new(i)
    end
    @queue.push Message::Finish
  end

end

thread_pool = Executors.new_fixed_thread_pool(10)
[ 
  thread_pool.execute(task: Reader.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
  thread_pool.execute(task: Writer.new(queue)),
].each do |t|
  t.join
end

puts RESULT.sort
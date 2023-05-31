class Device
  attr_reader :recordings
  def initialize
    @recordings = []
  end
  
  def listen 
    block_given? ? record(yield) : nil
  end
  
  def play
    puts recordings
  end
  
  private
  attr_reader :recordings

  def record(recording)
    @recordings << recording
  end
  
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"
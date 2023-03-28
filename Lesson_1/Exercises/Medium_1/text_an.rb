
#!/usr/bin/ruby


class TextAnalyzer
  def process
    @fname = 'text.txt'
    
    @lines = File.readlines(@fname)
    yield(@lines)
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |lines| p lines.count("\n") + 1 }
analyzer.process { |lines| p lines.join.count("\n") + 1 }
analyzer.process { |lines| p lines.join.count(" ") + lines.join.count("\n") - lines.count("\n") + 1 }

class TextAnalyzer
  def process
    @lines = File.open('text.txt', 'r')
    yield(@lines.read)
    @lines.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |lines| p lines.split("\n\n").count}
analyzer.process { |lines| p lines.split("\n").count }
analyzer.process { |lines| p lines.split(" ").count }
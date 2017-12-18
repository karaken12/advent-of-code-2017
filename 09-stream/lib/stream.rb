class Stream
  Garbage = Struct.new(:content) do
    def type
      :garbage
    end
  end

  def self.tokenize(stream)
    tokens = []
    in_garbage = false
    cancelling_char = false
    content = ''
    stream.each_char do |char|
      if cancelling_char
        cancelling_char = false
        next
      end
      if char == '!'
        cancelling_char = true
        next
      end
      if in_garbage
        if char == '>'
          in_garbage = false
          tokens << Garbage.new(content)
          content = ''
        else
          content += char
        end
        next
      elsif char == '<'
        in_garbage = true
        content = ''
        next
      end
      raise 'Don\'t know what to do.'
    end
    # TODO: check everything is empty
    tokens
  end
end

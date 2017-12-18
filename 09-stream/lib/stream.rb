class Stream
  class GarbageStart
    def type
      :garbage_start
    end
  end

  class GarbageEnd
    def type
      :garbage_end
    end
  end

  GarbageContent = Struct.new(:content) do
    def type
      :garbage_content
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
          tokens << GarbageContent.new(content)
          tokens << GarbageEnd.new
          content = ''
        else
          content += char
        end
        next
      elsif char == '<'
        tokens << GarbageStart.new
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

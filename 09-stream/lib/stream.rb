class Stream
  Garbage = Struct.new(:content) do
    def type
      :garbage
    end
  end

  def self.tokenize(stream)
    tokens = []
    in_garbage = false
    content = ''
    stream.each_char do |char|
      if in_garbage
        if char == '>'
          in_garbage = false
          tokens << Garbage.new(content)
          content = ''
        else
          content += char
        end
      elsif char == '<'
        in_garbage = true
        content = ''
      else
        raise 'Don\'t know what to do.'
      end
    end
    # TODO: check everything is empty
    tokens
  end
end

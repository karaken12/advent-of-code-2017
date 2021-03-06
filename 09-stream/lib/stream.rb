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

  class GroupStart
    def type
      :group_start
    end
  end

  class GroupEnd
    def type
      :group_end
    end
  end

  class Separator
    def type
      :separator
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
      if char == '{'
        tokens << GroupStart.new
        next
      end
      if char == '}'
        tokens << GroupEnd.new
        next
      end
      if char == ','
        tokens << Separator.new
        next
      end
      raise 'Don\'t know what to do.'
    end
    # TODO: check everything is empty
    tokens
  end

  def self.count_groups(tokens)
    tokens.select {|t| t.type == :group_start}.count
  end

  def self.score(tokens)
    running_total = 0
    level = 0
    tokens.each do |token|
      if token.type == :group_start
        level += 1
        running_total += level
      elsif token.type == :group_end
        level -= 1
      end
    end
    running_total
  end
end

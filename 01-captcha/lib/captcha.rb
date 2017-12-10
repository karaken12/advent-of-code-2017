class Captcha
  attr_reader :sum

  def initialize(captcha_string)
    @captcha_string = captcha_string
    process_captcha
  end

  def process_captcha
    @sum = 0
    for i in 0..(@captcha_string.length-1) do
      j = (i+1) % @captcha_string.length
      are_equal = @captcha_string[i] == @captcha_string[j]
      if are_equal
        @sum += @captcha_string[i].to_i
      end
    end
  end
end

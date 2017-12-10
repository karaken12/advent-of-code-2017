class Passphrase

  def initialize(phrase)
    @phrase = phrase
  end

  def valid
    @phrase.split(' ').group_by(&:itself).count{|k,v| v.count > 1} == 0
  end
end

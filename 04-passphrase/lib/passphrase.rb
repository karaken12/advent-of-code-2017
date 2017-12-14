class Passphrase

  def initialize(phrase)
    @phrase = phrase
  end

  def valid
    @phrase.split(' ').map{|p| p.chars.sort.join }.group_by(&:itself).count{|k,v| v.count > 1} == 0
  end
end

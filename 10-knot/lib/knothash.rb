class KnotHash
  SALT = [17, 31, 73, 47, 23]

  def self.translate(text)
    text.bytes
  end

  def self.hash(text)
    lengths = translate(text) + SALT
    loop1 = Loop.new(256)
    64.times do
      loop1.hash(lengths)
    end
    sparse_hash = loop1.elements
    dense_hash = self.dense_hash(sparse_hash)
    h = dense_hash.map{|i| i.to_s(16).rjust(2,'0')}.join('')
    h
  end

  def self.dense_hash(sparse_hash)
    sparse_hash.each_slice(16).map do |slice|
      slice[0] ^ slice[1] ^ slice[2] ^ slice[3] ^
      slice[4] ^ slice[5] ^ slice[6] ^ slice[7] ^
      slice[8] ^ slice[9] ^ slice[10] ^ slice[11] ^
      slice[12] ^ slice[13] ^ slice[14] ^ slice[15]
    end
  end
end

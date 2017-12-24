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
      slice.inject(0){|agg,x| agg ^ x }
    end
  end
end

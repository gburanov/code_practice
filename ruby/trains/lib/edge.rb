class Edge
  attr_reader :src, :dst, :length

  def initialize(src, dst, length)
    @src = src
    @dst = dst
    @length = length
  end

  def connects?(src_, dst_)
    src == src_ && dst == dst_
  end
end

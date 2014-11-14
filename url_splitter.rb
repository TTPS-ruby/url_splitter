class URLSplitter
  attr_reader :protocol, :domain, :path

  def initialize(url)
    @url = url
    parse!
  end

  def valid?
    !(protocol.nil? || domain.nil?)
  end

  private

  def parse!
    arr = @url.split('://')
    if arr.size > 1
      @protocol = arr[0]
      rest = arr[1].split('/')
      @domain = rest.first unless rest.first.empty?
      @path = rest[1..-1].join('/')
    end
  end
end


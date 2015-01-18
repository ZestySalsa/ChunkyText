require "ChunkyText/version"

module ChunkyText
  def self.chunk(text, max_length)
    text.scan(/.{#{max_length}}/)
    # binding.pry
  end
end

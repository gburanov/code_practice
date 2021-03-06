class AuthorFactory
  attr_reader :attributes

  def initialize(attributes)
    @attributes = attributes
  end

  def call
    authors(attributes['Author'])
  end

  def authors(attributes)
    attributes.split(/\s*,\s*/).map do |string|
      Author.new(name: string)
    end
  end
end

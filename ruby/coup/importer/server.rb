require 'sinatra'

require_relative './package'
require_relative './package_presenter'

set :bind, '0.0.0.0'

get '/' do
  content_type 'text/plain;charset=utf8'

  stream = StringIO.new
  Package.all.each do |package|
    PackagePresenter.new(package).call(stream)
  end
  stream.string
end

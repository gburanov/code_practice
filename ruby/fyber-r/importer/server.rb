require 'sinatra'

require_relative "./package"
require_relative "./package_presenter"

get '/' do
  Package.all.each do |package|
    PackagePresenter.new(package).call
  end
end

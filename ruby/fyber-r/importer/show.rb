require "./package"
require "./package_presenter"

Package.all.each do |package|
  PackagePresenter.new(package).call
end

maintainer       "Myplanet Digital"
maintainer_email "patrick@myplanetdigital.com"
license          "Apache 2.0"
description      "Installs/Configures gitosis"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

%w{ git python }.each do |cookbook|
  depends        cookbook
end

%w{ ubuntu }.each do |os|
  supports os
end

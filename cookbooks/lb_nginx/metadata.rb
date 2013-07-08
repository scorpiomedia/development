name             'lb_nginx'
maintainer       'Scorpio Interactive'
maintainer_email 'jesse@scorp.io'
license          'All rights reserved'
description      'Installs/Configures lb_nginx'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "rightscale"
depends "app"
depends "lb"

recipe "lb_nginx::default",
  "This loads the required 'lb' resource using the lb_nginx provider."

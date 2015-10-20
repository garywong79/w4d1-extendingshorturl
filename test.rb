require_relative 'app/models/url'

require_relative 'config/environments/init'
require_relative 'config/environments/test'
# require_relative 'config/database'
# require_relative 'config/puma'

Url.destroy_all
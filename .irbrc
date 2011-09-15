ActiveRecord::Base.logger = Logger.new(STDOUT)

require 'hirb'
Hirb.enable

Hirb::Formatter.dynamic_config['ActiveRecord::Base']

#$LOAD_PATH << File.expand_path('~/.ruby')

# Make gems available
require 'rubygems'
require 'irb/completion'

# Save history
IRB.conf[:SAVE_HISTORY] = 1500
IRB.conf[:HISTORY_FILE] = File.expand_path('~/.irb_history')

# Automatic Indentation
IRB.conf[:AUTO_INDENT] = true

# Load the readline module.
IRB.conf[:USE_READLINE] = true

# Remove the annoying irb(main):001:0 and replace with >>
IRB.conf[:PROMPT_MODE] = :SIMPLE

begin
  require 'interactive_editor'
rescue LoadError => err
  warn "Couldn't load interactive_editor: #{err}"
end

begin
  require 'awesome_print'
  AwesomePrint.irb!
rescue LoadError => err
  warn "Couldn't load awesome_print: #{err}"
end
## Enable wirble
#require 'wirble'
#Wirble.init
#
## Enable colored output
#Wirble.colorize

# load rails stuff?
# load (File.dirname(__FILE__) + '/.railsrc') if $0 == 'irb' && ENV['RAILS_ENV']

script_console_running = ENV.include?('RAILS_ENV') && IRB.conf[:LOAD_MODULES] && IRB.conf[:LOAD_MODULES].include?('console_with_helpers')
rails_running = ENV.include?('RAILS_ENV') && !(IRB.conf[:LOAD_MODULES] && IRB.conf[:LOAD_MODULES].include?('console_with_helpers'))
irb_standalone_running = !script_console_running && !rails_running

if script_console_running
  require 'logger'
  Object.const_set(:RAILS_DEFAULT_LOGGER, Logger.new(STDOUT))
end


begin
  require "pbcopy"
rescue LoadError
  $LOAD_PATH << '/Users/wgeorge/.rbenv/versions/2.2.4/lib/ruby/gems/2.2.0/gems/pbcopy-1.0.1/lib'
  $LOAD_PATH << '/Users/wgeorge/.rbenv/versions/2.2.4/lib/ruby/gems/2.2.0/gems/pasteboard-1.0/lib'
  require 'pbcopy'
end

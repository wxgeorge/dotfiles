Pry.config.should_load_plugins = false
Pry.config.editor='vim'

# if Pry.plugins.include?("byebug")
#   incompatible_plugins = ["nav", "debugger", "stack_explorer", "rescue"]
#   # pry-byebug is incompatible with pry-nav, pry-debugger, pry-stack_explorer
#   #     AND pry-byebug
#   # (these were build for older rubies)
#   # disable them if they are also present.
#   # This is important config given that
#   #   * pry automatically detects plugins (i.e. require's any gems starting with pry-) and
#   #   * bundler seems to default to installing dependencies into the system wide directory
#   incompatible_plugins.each do |plugin_name|
#     next if !Pry.plugins.include?(plugin_name)
#     $stderr.puts "Pry plugin incompatibility detected: pry-byebug and pry-#{plugin_name} are incompatible."
#     $stderr.puts "I will disable this, but this plugin is sufficiently incompatible with byebug, there's no guarantee your session will work."
#     $stderr.puts "You are recommended to run `gem uninstall pry-#{plugin_name}` and remove all references from your gemfiles."
#     Pry.plugins[plugin_name].disable!
#   end
# end

begin
  require 'awesome_print'
rescue LoadError
else
  AwesomePrint.pry!
end

Pry.config.editor="vim"

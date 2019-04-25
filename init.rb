# Connect all files and start the application

require_relative 'store'
require_relative 'formula'
require_relative 'interface'

interface = Interface.new
store = Store.new(interface)
store.start
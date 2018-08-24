$LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__)))
$LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__), 'responders'))
$LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__), 'consumers'))

require 'sinatra'
require 'foobar'

get '/frank-says' do
  Responders::Foobar.call({hello: 'Put this in your pipe & smoke it!'})
end

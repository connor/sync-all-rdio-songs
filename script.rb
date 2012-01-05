#!/usr/bin/env ruby

require 'rubygems'

require './rdio'
require './rdio_consumer_credentials'

# create an instance of the Rdio object with our consumer credentials
rdio = Rdio.new([RDIO_CONSUMER_KEY, RDIO_CONSUMER_SECRET])

# authenticate against the Rdio service
url = rdio.begin_authentication('oob')
puts 'Go to: ' + url
print 'Then enter the code: '
verifier = gets.strip
rdio.complete_authentication(verifier)

tracks    = rdio.call('getTracksInCollection')['result']
track_ids = []
t_length  = tracks.length

puts "First, I've got to get all of the tracks in your collection. One sec..."

tracks.each do |track|
  if track['canDownload']
    track_ids.push(track['key'].to_s)
  end
end

track_ids = track_ids.join(',')

puts "Great! Now it's time to flag them as available offline. This may take a few moments..."

rdio.call('setAvailableOffline', :keys => track_ids, :offline => true)

puts 'all done :)'

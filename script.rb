#!/usr/bin/env ruby

# (c) 2011 Rdio Inc
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

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

tracks.each_with_index { |track, i|
  if track['canStream']
    track_ids.push(track['key'].to_s)
  end
}

track_ids = track_ids.join(',').to_s

rdio.call('setAvailableOffline', :keys => track_ids, :offline => true)


puts 'all done :)'

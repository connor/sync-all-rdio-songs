# Sync all songs in Rdio collection to mobile device

This is a script, based **heavily** off of the [rdio-simple](github.com/rdio/rdio-simple) examples (by [Ian McKellar](https://github.com/ianloic) and [Michael Jackson](https://github.com/mjijackson)), that flags every song in your [Rdio](http://rd.io) account as `sync'd to mobile`. It's something I've wanted for a little while, and is just a personal tool I'd like to share with you all.

## How to use it

1. Clone the repo

2. Sign up for a developer account at: http://developer.rdio.com/

3. Paste in your *Consumer Key* and *Consumer Secret* in `rdio_consumer_credentails_SAMPLE.rb`.

3. Rename `rdio_consumer_credentials_SAMPLE.rb` to `rdio_consumer_credentials.rb`.

4. Open up a terminal, cd into the project directory, and run: `ruby script.rb`.

  - This will prompt you to go to a URL, and verify the auth by typing in a short number in the terminal. Once that is done, it will continue with the process. Once finished, it will print out 'all done :)'.

Let me know if you have any questions or comments in the issues!

<3

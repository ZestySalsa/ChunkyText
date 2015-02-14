[![Build Status](https://travis-ci.org/Integralist/Sinderella.png?branch=master)](https://travis-ci.org/Integralist/Sinderella)  [![Gem Version](https://badge.fury.io/rb/sinderella.png)](http://badge.fury.io/rb/sinderella) [![Coverage Status](https://coveralls.io/repos/Integralist/Sinderella/badge.png)](https://coveralls.io/r/Integralist/Sinderella)

# ChunkyText

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ChunkyText'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ChunkyText

## Usage

You have a given string. Example:
    
    string = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?

Initialize the ChunkyText object with the string and a max length
    
    text = ChunkyText::Chunker.new(string, 140)

Call `.chunk_array` on the object and get an array back.

    text.chunk_array #=> ["Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo",
 "inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
 "ut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.",
 "or sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat volupta",
 "em. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?",
 " autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo volu",
 "tas nulla pariatur?"]
    

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ChunkyText/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

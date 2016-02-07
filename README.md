## Layzr-Rails

This project integrates the jQuery [Layzr Plugin](https://github.com/callmecavs/layzr.js)
for Rails `image_tag` helpers

### What's jQuery Layzr Plugin?

From the project page:

*A small, fast, and modern library for lazy loading images.*

See [live demo](http://callmecavs.com/layzr.js/)

## Documentation

### Installation

Add it in your gemfile

    gem 'layzr-rails'

Create a configuration file and put it in your initializers `config/initializers/layzr.rb`


    Layzr::Rails.configure do |config|
      config.placeholder = "/assets/some-default-image.png"
    end

Add Layzr js and require layzr library in application.js ie:

    //= require layzr

And place the jvascript code:

    $(document).ready(function() {
       const instance = Layzr()
    });

### Features

* Add `lazy: true` option to Rails `image_tag` helpers to render layzr-friendly img tags.
* Simple (really). That's pretty much it.

### Example

    <%= image_tag "kittenz.png", alt: "OMG a cat!", lazy: true %>

Equals:

    <img alt="OMG a cat!" data-normal="/images/kittenz.png" src="/assets/some-default-image.png">

### More options

  
    <%= image_tag "normal.jpg", lazy: true, layzr: { retina: "retina.jpg", srcset: "small.jpg 320w, medium.jpg 768w, large.jpg 1024w"} %>

Equals:

    <img src="/assets/some-default-image.png" data-normal="normal.jpg" data-retina="retina.jpg" data-srcset="small.jpg 320w, medium.jpg 768w, large.jpg 1024w">  


## License

Layzr-Rails is released under the [MIT License](http://www.opensource.org/licenses/MIT).

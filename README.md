# layzr-rails

Lazy-load images in Rails by adding `lazy: true` to `image_tag`.

The gem rewrites the `<img>` tag so the real image sits in a `data-` attribute and the browser first loads a small
placeholder. [Layzr.js](https://github.com/callmecavs/layzr.js), a small dependency-free lazy-loading library, swaps
the real image in as it scrolls into view.

> **Version note.** This gem writes the attribute names of **Layzr.js 1.x** (`data-normal`, `data-retina`,
> `data-srcset`). Layzr.js 2 uses different attribute names, so use 1.x with this gem. The gem does not bundle the
> JavaScript: add Layzr.js to your app yourself. It was written for Rails 3.1 and later and has not been tested
> against recent Rails releases.

## Install

```ruby
gem 'layzr-rails'
```

Set the placeholder image shown before the real one loads, in `config/initializers/layzr.rb`:

```ruby
Layzr::Rails.configure do |config|
  config.placeholder = "/assets/some-default-image.png"
end
```

Load Layzr.js 1.x in your page and start it:

```js
const instance = Layzr()
```

## Use

```erb
<%= image_tag "kittenz.png", alt: "OMG a cat!", lazy: true %>
```

renders

```html
<img alt="OMG a cat!" data-normal="/images/kittenz.png" src="/assets/some-default-image.png">
```

Images without `lazy: true` render exactly as before.

### Retina and responsive images

```erb
<%= image_tag "normal.jpg", lazy: true,
      layzr: { retina: "retina.jpg", srcset: "small.jpg 320w, medium.jpg 768w, large.jpg 1024w" } %>
```

renders

```html
<img src="/assets/some-default-image.png" data-normal="normal.jpg" data-retina="retina.jpg"
     data-srcset="small.jpg 320w, medium.jpg 768w, large.jpg 1024w">
```

## How it works

The gem wraps Rails' `image_tag` helper. For a lazy image it moves the original `src` into `data-normal`, adds
`data-retina` and `data-srcset` when you pass them, and points `src` at your placeholder. Nokogiri is used to edit the
tag.

## License

[MIT](MIT-LICENSE).

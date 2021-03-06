## Atatus widget to Dashing

This is a [Dashing](http://shopify.github.com/dashing) widget to display the error and
performance metrics using the [Atatus API](https://www.atatus.com/docs/api).

![](https://raw.githubusercontent.com/atatus/dashing-atatus/master/preview.png)

## Dependencies

[faraday](https://github.com/lostisland/faraday) and [faraday_middleware](https://github.com/lostisland/faraday_middleware)

Add it to dashing's gemfile:

```
gem 'faraday'
gem 'faraday_middleware'
```

and run `bundle install`.

## Usage

1. copy `atatus.coffee`, `atatus.html`, and `atatus.scss` into the `/widgets/atatus` directory of your Dashing app. This directory does not exist in new Dashing apps, so you may have to create it.

2. Copy the `atatus.rb` file into your `/jobs` folder.

3. Now copy over the `atatus.yml` into the root directory of your Dashing application. Be sure to replace the following options inside of the config file with your own Atatus information:

```
:admin_api_key: "xxxxxxxxxxxxxxx"
```

To include the widget in a dashboard, add the following snippet to the dashboard layout file:

* **Page Load time widget**
```html
<li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
  <div id="atatus_load_time" data-id="atatus_load_time" data-view="Atatus" data-title="Load time (ms)" data-green="2000" data-yellow="5000"></div>
</li>
```

* **Throughput widget**
```html
<li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
  <div id="atatus_throughput" data-id="atatus_throughput" data-view="Atatus" data-title="Page views" data-green="20000" data-yellow="25000"></div>
</li>
```

* **Error count widget**
```html
<li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
  <div id="atatus_error_count" data-id="atatus_error_count" data-view="Atatus" data-title="Error count" data-green="1" data-yellow="3"></div>
</li>
```

## Customize responsive (color changing) widgets

You can customise the thresholds for the point at which the widgets change colours. This is done by changing the `data-green` and `data-yellow` attributes of the HTML you added to the dashboard above.

Any value between `data-green` and `data-yellow` will be yellow. If `data-green` is larger than `data-yellow`, then anything above `data-green` will be green, and anything below `data-yellow` will be red, and vice-versa.

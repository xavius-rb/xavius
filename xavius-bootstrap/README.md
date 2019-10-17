# Xavius Bootstrap

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'xavius-bootstrap'
```

And then execute:

    $ bundle


## Helpers

Use to `Xavius::FormBuilder` to benefit from custom inputs:

```haml
= form_with(model: card, builder: Xavius::FormBuilder) do |f|

  = f.form_group_for :title, :text_field
  = f.form_group_for :type, :text_field
  = f.form_group_for :status, :text_field

  .modal-footer
    = f.dismiss_button
    = f.submit_button

```
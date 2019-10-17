# Xavius Core

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'xavius-core'
```

And then execute:

    $ bundle


## Controllers

Just include `Xavius::Controller` module in your controller to benefit from a full CRUD behaviour.

```ruby
class PostsController < ApplicationController
  include Xavius::Controller
end
```

**IMPORTANT** all instance variables are now locals to each view, therefore index page will have access to `posts` instead of `@posts` as well as for the other default actions.

**Strong Parameters**
We highly recommend using Xavius Forms for setting up the attributes per action, like below otherwise all parameters will be automatically permitted.

```ruby
# app/forms/posts/create_form.rb
class Posts::CreateForm < Xavius::Form::Base
  attr_accessor :title, :body # declare all your permitted user input attributes in here.
end

```

### Overriding Actions

If:
- you need to set additional variables

```ruby
class PostsController < ApplicationController
  include Xavius::Controller

  def index
    @list = perform_action
  end
end
```


## Remote Controller

If you want a modal-based application with XHR requests you can include `Xavius::RemoteController` instead.

```ruby
class PostsController < ApplicationController
  include Xavius::RemoteController
end
```

**IMPORTANT** This may require changing your views to respond to remote requests properly (e.g: rendering your form inside a modal)


## Action Classes

Action classes are subclasses of `Xavius::Action::Base`. If you follow the convention when naming your action class, Xavius must successfuly load and execute your action:

All action classes are nampespaced by controller name: **<controller_name>::<action_name>Action**

To prevent mistakes when naming your class, use our generator `bin/rails generate xavius:action index posts` to create your action class.

Action classes can been seen as Service Objects so each action has its purpose. Actions classes offer:

- Prevent Fat Controllers: controllers are the doors for your action classes, they are a pure translation of URLs. Avoid putting logic in controllers.
- Ease unit testing: rest assured your basic controller's REST functionality is tested so you may only test your action.

```ruby
# app/actions/posts/index_action.rb
class Posts::IndexAction < Xavius::Action::Base
  def execute
    raise NotImplementedError, "Your action in app/actions/posts/index_action.rb must be implemented"
  end
end

```

Customise your action:

```ruby
# app/actions/posts/index_action.rb
class Posts::IndexAction < Xavius::Action::Base
  def execute
    Post.order(id: :desc)
  end
end

```

In your controllers you can call `perform_action` which executes the code above according to `params[:action]`.

Run: `bin/rails generate xavius:action update admin/cars` to generate namespaced classes appropriately:

```ruby
# app/actions/admin/cars/update_action.rb
class Admin::Cars::UpdateAction < Xavius::Action::Base
  def execute
    resource.update_attributes(resource_params)
  end
end
```

In `Xavius::Action::Base` subclass, you have access to:

* resource - ActiveRecord object
* resource_params - a Hash with permitted attributes sent within the request
* resource_class - ActiveRecord class

## Form Classes

Form classes are subclasses of `Xavius::Form::Base`. You can follow the same convention for naming your Form class so Xavius will automatically load your validations. We also have form generators so you can create classes mistake-free. Run `bin/rails generate xavius:form create posts`

Form classes are basically ActiveModel instances, so you can apply any ActiveModel validations that you don't want to be globally accessed when your ActiveRecord instance is created or updated. This offers:
- Extremelly flexibility: one ActiveRecord class can potentially have, in different contexts, a different set of validations to run.
- Prevent Fat Models: encapsulating validations per action form frees ActiveRecord from dedicated extensive logic.

```ruby
# app/forms/posts/create_form.rb
class Posts::CreateForm < Xavius::Form::Base
  attr_accessor :title, :body
  validates_presence_of :body
end

```
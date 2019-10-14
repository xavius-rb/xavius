module Posts
  class UpdateForm < Xavius::Form::Base
    attr_accessor :title
  end

  class FindDataForm
  end

  class UpdateAction < Xavius::Action::Base
    def execute
      resource.update(resource_params)
    end
  end

  class FindDataAction
  end
end

module Portal
  class Post
  end

  module Posts
    class UpdateForm
    end

    class UpdateAction
    end
  end
end

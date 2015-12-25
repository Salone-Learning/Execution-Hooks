# Execution Hooks

Rails provide a feature of before_action, using which user can specify which hook needs to be executed before the intended method call. But if we want to achieve the same without rails...

Execution Hooks is a general purpose framework which provides this feature for any Ruby class or module. User can include this module in his existing/new class or module. He can specify the hook that needs to be executed before given method. That's all, the framework will take care of the rest.

### Examples

Following are 2 examples which demonstrate the usage of the framework:

##### For existing class

Suppose ExistingClass is the class to which user wants to add before_action feature. 
```sh
  class TestExistingClass
    def initialize
      @num = 0
      @val = 0
    end
    
    def self.get_num
      @num
    end
  end
```

Following is how, a before_action hook can be done:
```sh
  class TestExistingClass
    include Hooks
    before_action :set_num, :get_num

    def self.set_num
      @num = 5
    end
  end
```

##### For new class

Suppose NewClass is the class to which user wants to add before_action feature. Following is how, it can be done:
```sh
  class TestInstanceMethodHook
    include Hooks

    def initialize
      @num = 0
    end

    def get_num
      @num
    end

    def set_num
      @num = 5
    end

    before_action :set_num, :get_num
  end
```

License
----

MIT


**Free Software, Enjoy!**

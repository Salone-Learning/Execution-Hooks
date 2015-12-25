require 'spec_helper'

RSpec.configure do |c|
  c.expose_current_running_example_as :example
end

describe 'Execution hooks' do
  context 'for existing class' do
    before(:each) do
      class TestExistingClass
        def initialize
          @num = 0
          @val = 0
        end

        def self.get_num
          @num
        end

        def get_val
          @val
        end
      end
    end

    it 'returns normal value class method' do
      expect(TestExistingClass.get_num).to eq(nil)
    end

    it 'returns normal value instance method' do
      expect(TestExistingClass.new.get_val).to eq(0)
    end

    it 'should add before_action hook for class method' do
      class TestExistingClass
        include Hooks

        before_action :set_num, :get_num

        def self.set_num
          @num = 5
        end
      end

      expect(TestExistingClass.get_num).to eq(5)
    end

    it 'should add before_action hook for instance method' do
      class TestExistingClass
        include Hooks

        before_action :set_val, :get_val

        def set_val
          @val = 10
        end
      end

      expect(TestExistingClass.new.get_val).to eq(10)
    end
  end

  context 'for new class' do
    it 'should add before_action hook for class method' do
      class TestClassMethodHook
        include Hooks

        def initialize
          @num = 0
        end

        def self.get_num
          @num
        end

        def self.set_num
          @num = 5
        end

        before_action :set_num, :get_num
      end

      expect(TestClassMethodHook.get_num).to eq(5)
    end

    it 'should add before_action hook for instance method' do
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

      expect(TestInstanceMethodHook.new.get_num).to eq(5)
    end
  end
end
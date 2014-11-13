module Godmin
  class PolicyFinder
    class << self
      def find(object)
        klass =
          if object.respond_to?(:model_name)
            object.model_name
          elsif object.class.respond_to?(:model_name)
            object.class.model_name
          elsif object.is_a?(Class)
            object
          elsif object.is_a?(Symbol)
            object.to_s.classify
          else
            object.class
          end

        if Godmin.mounted_as
          "#{Godmin.mounted_as.classify}::#{klass}Policy"
        else
          "#{klass}Policy"
        end
      end
    end
  end
end

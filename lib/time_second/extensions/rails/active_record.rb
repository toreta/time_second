# frozen_string_literal: true

module TimeSecond
  module ActiveRecord
    class Type < ActiveModel::Type::Integer
      def cast(value)
        if value.is_a?(Numeric)
          super(::TimeSecond.new(value))
        elsif value.is_a?(String)
          super(::TimeSecond.parse(value))
        else
          super
        end
      end

      def deserialize(value)
        cast(value)
      end

      def serialize(value)
        value.to_i
      end
    end
  end
end

# frozen_string_literal: true

require File.expand_path('rails/active_record', __dir__)

# Install :time_second attribute type
ActiveRecord::Type.register(:time_second, TimeSecond::ActiveRecord::Type)

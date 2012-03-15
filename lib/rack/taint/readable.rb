module Rack
  class Taint
    module Readable
      %w(getc gets read readpartial read_nonblock readline readlines sysread).each do |method|
        class_eval <<-ruby, __FILE__, __LINE__.succ
          def #{method}(*args)
            if tainted?
              super.taint
            else
              super
            end
          end
        ruby
      end
    end
  end
end

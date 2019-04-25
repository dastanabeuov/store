# Basic logic (policy) of calculation

class Formula
  attr_accessor :results

  def initialize(interface)
    @interface = interface
  end

  def accept_process(codes)
    @results = {}
    codes.uniq.each { |element| @results[element] = codes.count(element) }
    calculate(@results)
  end

  def calculate(results)
    results.each do |key, value|
      case key
      when 'cc'
        name = 'Coca-Cola'
        count = value
        if count >= 1
          mount = count * 1.50
          count += count
          @interface.total(mount, count, name)
        end
      when 'pc'
        name = 'Pepsi-Cola'
        count = value
        if count >= 3
          count = count
          mount = 2.0 * count * 100 / 80
          @interface.total(mount, count, name)
        else
          count = count
          mount = count * 2.00
          @interface.total(mount, count, name)
        end
      end
    end
  end
end

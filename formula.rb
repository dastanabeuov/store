# Basic logic (policy) of calculation

class Formula
  STORE = { 'CC' => 1.50, 'PC' => 2.00, 'WA' => 0.85 }

  def initialize(interface)
    @interface = interface
  end

  def accept_process(codes)
    result = {}
    codes.uniq.each{|element| result[element] = codes.count(element)}
    calculate(result)
  end

  private

  def calculate(items)
    items.each do |item|
      case item
      when 'CC'
        name = "Coca-Cola"
        count = items['CC']
        if count >= 1
          mount = count * 1.50
          count = count + count
          @interface.total(mount, count, name)
        else
          nil
        end
      when 'PC'
        name = "Papci-Cola"
        count = items[PC]
        if count >= 3
          count = count
          mount = count * 100 / 20
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
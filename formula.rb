# Basic logic (policy) of calculation

class Formula
  BASIC_LIST = {'cc' => 1.5, 'pc' => 2.0}
  SECOND_FREE = {'cc' => 1.5}
  MORE_THAN_THREE = {'pc' => 2.0}
  PERCENT = 20 

  def initialize(interface)
    @interface = interface
  end

  def accept_process(codes)
    @results = {}
    codes.uniq.each { |element| @results[element] = codes.count(element) }
    calculate(@results)
  end

  private

  def calculate(results)
    results.each do |key, value|
      if SECOND_FREE.include?(key)
        second_free(key, value)
      elsif value >= 3 && MORE_THAN_THREE.include?(key)
        more_than_three(key, value)
      elsif BASIC_LIST.include?(key)
        basic_list(key, value)
      else
        @interface.error
      end
    end
  end

  def second_free(key, value)
    mount = value * SECOND_FREE[key]
    value += value
    @interface.total(key, value, mount)
  end

  def more_than_three(key, value)
    mount = MORE_THAN_THREE[key] * value * (100 - PERCENT) / 100
    @interface.total(key, value, mount)
  end

  def basic_list(key, value)
    mount = value * BASIC_LIST[key]
    @interface.total(key, value, mount)
  end    
end

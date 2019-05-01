# master file that controls the application

class Store
  def initialize(interface)
    @interface = interface
    @formula = Formula.new(interface)
  end

  def start
    @interface.welcome
    @interface.info
    @interface.admission_rules
    run
  end    

  private

  def run
    codes = @interface.input_code
    accept(codes)
    new_action
  end

  def accept(codes)
    @formula.accept_process(codes)
  end

  def new_action
    answer = @interface.continue
    if answer == 'y'
      start
    else
      @interface.end
    end
  end  
end

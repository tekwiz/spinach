module Spinach
  # This class represents the exception raised when Spinach can't find a step
  # for a {FeatureSteps}.
  #
  class StepNotDefinedException < StandardError
    attr_reader :step

    # @param [Hash] step
    #   The missing step.
    #
    # @api public
    def initialize(step)
      @step = step
    end

    # @return [String]
    #   A custom message when scenario steps aren't found.
    #
    # @api public
    def message
      "Step #{step_name} not found"
    end

    private

    def step_name
      @step.respond_to?(:name) ? %('#{@step.name}') : @step.inspect
    end
  end

  class StepPendingException < StandardError
    attr_reader :reason
    attr_accessor :step

    # @param [String] reason
    #   The reason why the step is set to pending
    #
    # @api public
    def initialize(reason)
      @reason = reason
    end

    # @return [String]
    #   A custom message when scenario steps are pending.
    #
    # @api public
    def message
      "Step #{step_name} pending"
    end

    private

    def step_name
      @step.respond_to?(:name) ? %('#{@step.name}') : @step.inspect
    end
  end
end

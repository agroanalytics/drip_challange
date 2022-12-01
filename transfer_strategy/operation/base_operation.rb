module UseCase
  module Drip
    module TransferStrategy
      module Constraint
        class BaseOperation
          def initialize(credit_amount)
            @credit_amount = credit_amount
          end

          def perform
            raise 'Child class must implement this'
          end
        end
      end
    end
  end
end

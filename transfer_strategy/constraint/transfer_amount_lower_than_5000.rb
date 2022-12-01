module UseCase
  module Drip
    module TransferStrategy
      module Constraint
        class TransferAmountLowerThan5000 < BaseConstraint
          def valid?
            raise('Transfer amount greater than allowed') unless @transfer_dto.amount <= 5000

            true
          end
        end
      end
    end
  end
end

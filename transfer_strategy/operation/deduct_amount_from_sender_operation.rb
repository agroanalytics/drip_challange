module UseCase
  module Drip
    module TransferStrategy
      module Constraint
        class DeductAmountFromSenderOperation < BaseOperation
          def initialize(credit_amount)
            @credit_amount = credit_amount
          end

          def perform
            result = OpenStruct.new(
              account_from: @credit_amount.account_from - 5
              account_to: @credit_amount.account_to
            )
          end
        end
      end
    end
  end
end

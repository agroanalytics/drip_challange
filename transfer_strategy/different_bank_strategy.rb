module UseCase
  module Drip
    module TransferStrategy
      class DifferentBankStrategy < BaseTransferStrategy
        def initialize(transfer_dto)
          super
          @constraints = [LimitShouldBeLowerThan5000]
          @operations_in_order = [DeductComissionOperation]
        end
      end
    end
  end
end

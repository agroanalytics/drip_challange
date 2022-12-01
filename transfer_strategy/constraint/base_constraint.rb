module UseCase
  module Drip
    module TransferStrategy
      module Constraint
        class BaseConstraint
          def initialize(transfer_dto)
            @transfer_dto = transfer_dto
          end

          def valid?
            raise 'Child class must implement this'
          end
        end
      end
    end
  end
end

module UseCase
  module Drip
    module TransferStep
      class ValidateConstraints
        def initialize(transfer_dto, constraints)
          @transfer_dto = transfer_dto
          @constraints = constraints
        end

        def perform
          valid_constraints?
        end

        private

        def valid_constraints?
          return true if @constraints.empty?
          @constraints.map { |constraint| constraint.new(@transfer_dto).valid? }.all?
        end
      end
    end
  end
end

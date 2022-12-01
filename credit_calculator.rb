module UseCase
  module Drip
    class CreditCalculator
      def initialize(transfer_dto, operations)
        @transfer_dto = transfer_dto
        @operations_in_order = operations
      end

      def calculate_total_credit
        amount_to_credit = OpenStruct.new(
          account_from: @transfer_dto.account_from, account_to: @transfer_dto.account_to
        )

        @operations_in_order.each do |operation|
          amount_to_credit = operation.perform(amount_to_credit)
        end

        amount_to_credit
      end
    end
  end
end

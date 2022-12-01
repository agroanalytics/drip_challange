require 'date'

module UseCase
  module Drip
    class TransferMoney
      def initialize(account_from_id, account_to_id, amount_to_transfer)
        @money_transfer_service = overrides.fetch(:money_transfer_service) do
          MoneyTransferService
        end
      end

      def transfer(account_from_id, account_to_id, amount_to_transfer)
        transfer_dto = to_dto(account_from_id, account_to_id, amount_to_transfer)
        @money_transfer_service.transfer(transfer_dto)
      end

      private

      def to_dto(account_from_id, account_to_id, amount_to_transfer)
        TransferDto.new(account_from_id, account_to_id, amount_to_transfer)
      end
    end
  end
end

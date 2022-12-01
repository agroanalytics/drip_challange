require 'date'

module UseCase
  module Drip
    class TransferDto
      attr_reader :account_id_from, :account_id_to, :amount_to_transfer

      def initialize(account_from_id, account_to_id, amount_to_transfer)
        @account_id_from = account_id_from
        @account_id_to = account_id_to
        @amount_to_transfer = amount_to_transfer
      end
    end
  end
end

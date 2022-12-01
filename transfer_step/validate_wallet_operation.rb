module UseCase
  module Drip
    module TransferStep
      class ValidateWalletOperation
        def initialize(total_credit)
          @total_credit = total_credit
          @account_repository = AccountRepository.new
        end

        def perform
          raise('Invalid operation due to insuficient money amount') unless valid_wallet_operation?

          true
        end

        private

        def valid_wallet_operation?
          # Total credit values can be either positive or negative, thus summing always will do the correct math
          return false if account_from.amount + total_credit.account_from <= 0
          return false if account_to.amount + total_credit.account_to <= 0

          true
        end

        def account_from
          @account_from ||= AccountRepository.find(@transfer_dto.account_id_from)
        end

        def account_to
          @account_to ||= AccountRepository.find(@transfer_dto.account_id_to)
        end
      end
    end
  end
end

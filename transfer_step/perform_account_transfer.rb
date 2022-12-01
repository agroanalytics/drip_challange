module UseCase
  module Drip
    module TransferStep
      class PerformAccountTransfer
        def initialize(credit, transfer_dto)
          @total_credit = credit
          @transfer_dto = transfer_dto
          @account_repository = AccountRepository
        end

        def perform
          perform_account_transfer
        end

        private

        def perform_account_transfer
          transaction do
            account_from.amount = account_from.amount += @total_credit.account_from
            account_to.amount = account_to.amount += @total_credit.account_to
          end
        end

        def account_from
          @account_from ||= @account_repository.find(@transfer_dto.account_id_from)
        end

        def account_to
          @account_to ||= @account_repository.find(@transfer_dto.account_id_to)
        end
      end
    end
  end
end

# frozen_string_literal: true

require 'jumio/entities'
require 'active_support/core_ext/hash/deep_merge'

module Jumio
  module Factories
    def self.scan_status_failed(options = {})
      Entities::ScanStatus.new({
        timestamp: '2018-10-29T15:56:54.398Z',
        scanReference: 'WEB_UPLOAD',
        status: 'FAILED'
      }.deep_merge(options))
    end

    def self.scan_status_pending(options = {})
      Entities::ScanStatus.new({
        timestamp: '2018-10-29T15:56:54.398Z',
        scanReference: 'WEB_UPLOAD',
        status: 'PENDING'
      }.deep_merge(options))
    end

    def self.scan_denied_fraud(options = {})
      Entities::Scan.new({
        document: {
          status: 'DENIED_FRAUD'
        },
        transaction: {
          date: '2018-10-29T15:56:54.398Z',
          source: 'WEB_UPLOAD',
          status: 'DONE',
          updatedAt: '2018-10-29T15:56:54.398Z'
        },
        verification: {
          rejectReason: {
            rejectReasonCode: '106',
            rejectReasonDescription: 'FAKE'
          }
        }
      }.deep_merge(options))
    end

    def self.scan_with_identity_match(options = {})
      Entities::Scan.new({
        document: {
          status: 'APPROVED_VERIFIED',
        },
        transaction: {
          date: '2018-10-29T15:56:54.398Z',
          source: 'WEB_UPLOAD',
          status: 'DONE',
          updatedAt: '2018-10-29T15:56:54.398Z',
        },
        verification: {
          identityVerification: {
            similarity: 'MATCH',
            validity: 'true'
          }
        }
      }.deep_merge(options))
    end

    def self.scan_with_identity_match_and_us_id(options = {})
      Entities::Scan.new({
        document: {
          address: {
            city: "SAN FRANCISCO",
            country: "USA",
            stateCode: "US-CA",
            streetName: "20TH",
            streetNumber: "560",
            streetSuffix: "ST",
            zip: "94107"
          },
          dob: '1980-01-02',
          expiry: "2022-01-02",
          firstName: 'John',
          issuingCountry: "USA",
          lastName: 'Doe',
          number: 'A1234567',
          status: 'APPROVED_VERIFIED',
          usState: 'CA'
        },
        transaction: {
          date: '2018-10-29T15:56:54.398Z',
          source: 'WEB_UPLOAD',
          status: 'DONE',
          updatedAt: '2018-10-29T15:56:54.398Z',
        },
        verification: {
          identityVerification: {
            similarity: 'MATCH',
            validity: 'true'
          }
        }
      }.deep_merge(options))
    end

    def self.scan_with_match_not_possible(options = {})
      params = {
        verification: {
          identityVerification: {
            similarity: 'NOT_POSSIBLE',
            validity: 'true'
          }
        }
      }.deep_merge(options)
      scan_with_identity_match(params)
    end

    def self.scan_with_wrong_person(options = {})
      Entities::Scan.new({
        document: {
          status: 'APPROVED_VERIFIED'
        },
        transaction: {
          date: '2018-10-29T15:56:54.398Z',
          source: 'WEB_UPLOAD',
          status: 'DONE',
          updatedAt: '2018-10-29T15:56:54.398Z'
        },
        verification: {
          identityVerification: {
            similarity: 'NO_MATCH',
            validity: 'true'
          }
        }
      }.deep_merge(options))
    end

    def self.scan_with_unacceptable_selfie(reason, options = {})
      Entities::Scan.new({
        document: {
          status: 'APPROVED_VERIFIED'
        },
        transaction: {
          date: '2018-10-29T15:56:54.398Z',
          source: 'WEB_UPLOAD',
          status: 'DONE',
          updatedAt: '2018-10-29T15:56:54.398Z'
        },
        verification: {
          identityVerification: {
            reason: reason,
            similarity: 'NOT_POSSIBLE',
            validity: 'false'
          }
        }
      }.deep_merge(options))
    end

    def self.scan_with_unsupported_id_type(options = {})
      Entities::Scan.new({
        document: {
          status: 'DENIED_UNSUPPORTED_ID_TYPE'
        },
        transaction: {
          date: '2018-10-29T15:56:54.398Z',
          source: 'WEB_UPLOAD',
          status: 'DONE',
          updatedAt: '2018-10-29T15:56:54.398Z'
        },
      }.deep_merge(options))
    end

    def self.scan_with_unsupported_id_country(options = {})
      params = {
        document: { status: 'DENIED_UNSUPPORTED_ID_COUNTRY' }
      }.deep_merge(options)
      scan_with_unsupported_id_type(params)
    end

    def self.scan_with_error_not_readable_id(options = {})
      Entities::Scan.new({
        document: {
          status: 'ERROR_NOT_READABLE_ID'
        },
        transaction: {
          date: '2018-10-29T15:56:54.398Z',
          source: 'WEB_UPLOAD',
          status: 'DONE',
          updatedAt: '2018-10-29T15:56:54.398Z'
        },
        verification: {
          rejectReason: {
            rejectReasonCode: '200',
            rejectReasonDescription: 'NOT_READABLE_DOCUMENT'
          }
        }
      }.deep_merge(options))
    end

    def self.scan_with_no_id_uploaded(options = {})
      Entities::Scan.new({
        document: {
          status: 'NO_ID_UPLOADED'
        },
        transaction: {
          date: '2018-10-29T15:56:54.398Z',
          source: 'WEB_UPLOAD',
          status: 'FAILED',
          updatedAt: '2018-10-29T15:56:54.398Z'
        },
      }.deep_merge(options))
    end

    def self.scan_with_no_identity_verification(options = {})
      Entities::Scan.new({
        document: {
          status: 'APPROVED_VERIFIED'
        },
        transaction: {
          date: '2018-10-29T15:56:54.398Z',
          source: 'WEB_UPLOAD',
          status: 'DONE',
          updatedAt: '2018-10-29T15:56:54.398Z'
        },
        verification: {
          mrzCheck: 'NOT_AVAILABLE'
        }
      }.deep_merge(options))
    end

    def self.verfication_response(options = {})
      Entities::VerificationResponse.new({
        timestamp: '2018-10-29T15:56:54.398Z',
        transactionReference: 'a527ae56-ea7a-4476-a2de-1a678bd6189d',
        redirectUrl: 'https://netverify.com/web/v4/app?authorizationToken=TOKEN&locale=en-US'
      }.deep_merge(options))
    end
  end
end

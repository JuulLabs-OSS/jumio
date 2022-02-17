require 'spec_helper'
require 'jumio/factories'

RSpec.describe "Factory object" do
  describe "#scan_denied_fraud" do
    subject { Jumio::Factories.scan_status_failed }

    it "returns a valid scan status entity" do
      expect(subject).to be_a(Jumio::Entities::ScanStatus)
    end
  end

  describe "#scan_status_pending" do
    subject { Jumio::Factories.scan_status_pending }

    it "returns a valid scan status entity" do
      expect(subject).to be_a(Jumio::Entities::ScanStatus)
    end
  end

  describe "#scan_denied_fraud" do
    subject { Jumio::Factories.scan_denied_fraud }

    it "returns a valid scan entity" do
      expect(subject).to be_a(Jumio::Entities::Scan)
    end
  end

  describe "#scan_with_identity_match" do
    subject { Jumio::Factories.scan_with_identity_match }

    it "returns a valid scan entity" do
      expect(subject).to be_a(Jumio::Entities::Scan)
    end
  end

  describe "#scan_with_wrong_person" do
    subject { Jumio::Factories.scan_with_wrong_person }

    it "returns a valid scan entity" do
      expect(subject).to be_a(Jumio::Entities::Scan)
    end
  end

  describe "#scan_with_unacceptable_selfie" do
    subject { Jumio::Factories.scan_with_unacceptable_selfie('BAD_QUALITY') }

    it "returns a valid scan entity" do
      expect(subject).to be_a(Jumio::Entities::Scan)
    end
  end

  describe "#scan_with_unsupported_id_type" do
    subject { Jumio::Factories.scan_with_unsupported_id_type }

    it "returns a valid scan entity" do
      expect(subject).to be_a(Jumio::Entities::Scan)
    end
  end

  describe "#scan_with_unsupported_id_country" do
    subject { Jumio::Factories.scan_with_unsupported_id_country }

    it "returns a valid scan entity" do
      expect(subject).to be_a(Jumio::Entities::Scan)
    end
  end

  describe "#scan_with_no_id_uploaded" do
    subject { Jumio::Factories.scan_with_no_id_uploaded }

    it "returns a valid scan entity" do
      expect(subject).to be_a(Jumio::Entities::Scan)
    end
  end

  describe "#scan_with_no_identity_verification" do
    subject { Jumio::Factories.scan_with_no_identity_verification }

    it "returns a valid scan entity" do
      expect(subject).to be_a(Jumio::Entities::Scan)
    end
  end

  describe "#verfication_response" do
    subject { Jumio::Factories.verfication_response }

    it "returns a valid verification responsey" do
      expect(subject).to be_a(Jumio::Entities::VerificationResponse)
    end
  end
end

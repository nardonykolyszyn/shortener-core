# frozen_string_literal: true

require 'spec_helper'

describe ShortenedUrl do
  subject { FactoryBot.build(:shortened_url) }

  let(:resource_name)      { described_class }
  let(:valid_url)          { FactoryBot.build(:shortened_url) }
  let(:invalid_url)        { FactoryBot.build(:shortened_url, :with_invalid_url) }
  let(:url_with_no_scheme) { FactoryBot.build(:shortened_url, :with_no_scheme) }
  let(:unavailable_url)    { FactoryBot.build(:shortened_url, :with_unavailable_url) }
  let(:url_with_no_url)    { FactoryBot.build(:shortened_url, :with_empty_url) }

  before do
    VCR.use_cassette('shortened_url#create') do
      subject.save
    end
  end

  describe 'shortened url cyclelife' do
    context 'validations' do
      it 'should pass all validations' do
        expect(valid_url).to be_valid
      end

      it 'should raise an error' do
        expect(url_with_no_url.valid?).to be false
      end
    end

    context 'before create' do
      it 'should persist a valid url' do
        VCR.use_cassette('valid_url#save') do
          expect(valid_url.save).to be true
        end
      end

      it 'should persist an invalid url' do
        VCR.use_cassette('invalid_url#save', record: :new_episodes) do
          expect(invalid_url.save).to be true
        end
      end

      it 'should persist a no scheme url' do
        VCR.use_cassette('url_with_no_scheme#save') do
          expect(valid_url.save).to be true
        end
      end

      it 'should persist a non-existing url' do
        VCR.use_cassette('unavailable_url#save') do
          expect(valid_url.save).to be true
        end
      end
    end

    context 'after create' do
      it 'should has a valid shorten url' do
        expect(subject.shortened_url).to match(Shortener::LINK_HAS_PROTOCOL)
      end

      it 'should increase counter' do
        expect(subject.increment_usage_counter).to eq(1)
      end
    end
  end
end

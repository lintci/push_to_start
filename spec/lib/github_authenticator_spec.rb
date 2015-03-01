require 'spec_helper'
require 'github_authenticator'

describe GithubAuthenticator do
  let(:token){build(:token)}
  let(:form_payload){build(:form_payload)}
  subject(:authenticator){described_class.new(token)}

  describe '#authenticated?' do
    context 'when payload is signed' do
      let(:signature){build(:signature)}

      it 'returns true' do
        expect(authenticator).to be_authenticated(form_payload, signature)
      end
    end

    context 'when payload is incorrectly signed' do
      let(:signature){'sha1=1234'}

      it 'returns true' do
        expect(authenticator).to_not be_authenticated(form_payload, signature)
      end
    end
  end
end

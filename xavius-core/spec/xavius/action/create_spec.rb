RSpec.describe Xavius::Action::Create do
  let(:expect_method) { :save }
  it_behaves_like :xavius_action
end

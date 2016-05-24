require 'bike'

  describe 'New Bike instance' do
  it 'should create an instance' do
  expect(Bike.new).to be_instance_of(Bike)
  end
end

  RSpec.describe Bike.new do
    describe 'when working? is called'
    it {is_expected.to respond_to(:working?)}
    end

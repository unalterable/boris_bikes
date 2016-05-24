require 'bike'
  describe 'New Bike instance' do
  it 'should create an instance' do
  expect(Bike.new).to be_instance_of(Bike)
  end
end
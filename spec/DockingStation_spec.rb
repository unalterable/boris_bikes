require 'DockingStation'

RSpec.describe DockingStation.new do

  describe 'Docking Station' do
  it { should be_instance_of(DockingStation)}
  end

  describe 'Responds to release bike' do
  it { is_expected.to respond_to(:release_bike) }
  end

end
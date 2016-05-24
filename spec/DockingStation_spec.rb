require 'DockingStation'

RSpec.describe DockingStation.new do

describe 'Docking Station' do
  it { should be_instance_of(DockingStation)}
  end

  describe 'Responds to release bike' do
  #expect(DockingStation.new).to respond_to(release_bike)
  it { responds_to.release_bike }
  end

end
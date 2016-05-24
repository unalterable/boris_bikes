require 'DockingStation'
require 'bike'

  describe DockingStation do

  it { should be_instance_of(DockingStation)}

  it { is_expected.to respond_to(:release_bike) }

  it { subject.release_bike.should be_instance_of(Bike) }
  end



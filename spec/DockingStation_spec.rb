require 'DockingStation'
require 'bike'

  describe DockingStation do

  it { should be_instance_of(DockingStation)}

  it { is_expected.to respond_to(:release_bike) }

  it { subject.release_bike.should be_instance_of(Bike) }

  it { is_expected.to respond_to(:docked_status) }

  it { is_expected.to respond_to(:dock_bike) }

  it { subject.dock_bike.should be(true) }

  end



require './lib/accommodation_service'


describe AccommodationService do

  describe '#.all' do
    it 'returns a list of accommodation' do
      DatabaseConnection.query("INSERT INTO accommodation(name, description, location, price) VALUES('Cottage', 'Nice cottage in Deptford', 'London', 40);")
      accom_list = AccommodationService.all
      expect(accom_list.first.description).to eq "Nice cottage in Deptford"
    end
  end

  describe '#.find(id)' do
    it 'returns the accommodation object with the given id' do
      load_test_accom

      accom = AccommodationService.find(1)
      expect(accom).to be_an_instance_of(Accommodation)
      expect(accom.id).to eq '1'
      expect(accom.name).to eq 'Cottage'
      expect(accom.price).to eq '40'
    end
  end

  describe '#.create' do
    it 'adds a new listing' do
      accom = AccommodationService.create(name: 'Caravan', description: 'An absolute hell hole in the middle of nowhere', location: 'Blackpool', price: 120, host_id: 7)
      expect(accom).to be_an_instance_of(Accommodation)
      # Add eq persisted_data['id']
  end

end
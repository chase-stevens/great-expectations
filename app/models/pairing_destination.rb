class PairingDestination
  def initialize(pairing_array)
    @pairing_array = pairing_array
  end

  def write
    return if @pairing_array.empty?
    source = @pairing_array.first[:source]
    chapter = @pairing_array.first[:chapter]
    Pairing.where(chapter: chapter, source: source).delete_all
    Pairing.insert_all(@pairing_array) 
  end
end
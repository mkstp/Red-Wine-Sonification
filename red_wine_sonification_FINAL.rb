#Spectral profile sonification algorithm
#Arranged for Sonic Pi by Marc St. Pierre May 2018

require 'csv'
use_osc "localhost", 12000

$data = CSV.parse(File.read("/Users/marcstpierre/Google Drive/red.csv"), {:headers => true, :header_converters => :symbol})

define :histogram do |data, key, mul|
  data[key].inject(Hash.new(0)) { |hash, value| hash[quantise(value.to_f * mul, 1)] += 1; hash}
end

define :normalize do |list, outMinmax, inMinmax = list.minmax|
  listRange = inMinmax[1] - inMinmax[0]
  outRange = outMinmax[1] - outMinmax[0]
  temp_list = list.map {|value| outMinmax[0] + (value-inMinmax[0]) * (outRange.to_f / listRange)}
end

key = scale(:c4, :major, num_octaves: 1)

parameter = [
  ##| :volatile_acidity,
  ##| :fixed_acidity,
  ##| :citric_acid,
  ##| :residual_sugar,
  ##| :chlorides,
  ##| :free_sulfur_dioxide,
  ##| :total_sulfur_dioxide,
  ##| :density,
  ##| :ph,
  ##| :sulphates,
  ##| :alcohol,
  :quality,
].ring

live_loop :univariate_distribution do
  h = histogram($data, parameter.tick, 1000)
  osc "/param", parameter.look.to_s
  
  notes = normalize(h.keys, [0, key.size - 1])
  amps = normalize(h.values, [0.01, 0.5])
  pans = normalize(h.keys, [-1, 1])
  
  #have headphones on with the correct orientation
  use_synth :tri
  notes.size.times do |index|
    play key[notes[index].to_i], amp: amps[index], pan: pans[index], attack: 1, release: 3
  end
  sleep 5
end

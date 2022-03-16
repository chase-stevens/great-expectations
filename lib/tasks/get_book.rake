desc "Get a text file from a URL and save into the source database"
task :get_book, [:url] => :environment do |t, args|
  response = Faraday.get(args[:url])
  text = response.body.force_encoding('UTF-8')
  s = Source.create(text: text, url: args[:url])
  puts "Book Created!"
  puts "ID: #{s.id}"
  puts "URL: #{s.url}"
  puts "SAMPLE TEXT: #{s.text[0,100]}"
end

desc "Count word pairings in book"
task :transform_book_to_pairings, [:id] => :environment do |t, args|
  source = Source.find(args[:id])
  tokenizer = PragmaticTokenizer::Tokenizer.new(punctuation: :none, downcase: true)

  chapter_count = 0
  source.each_chapter do |chapter_text|
    pairing_hash = Hash.new
    tokenized_chapter = tokenizer.tokenize(chapter_text)
    prev_token = ""

    tokenized_chapter.each do |token|
      pairing = prev_token + " " + token
      if !prev_token.empty?
        pairing_hash[pairing] ||= 0
        pairing_hash[pairing] += 1
      end
      prev_token = token
    end

    pairing_array = Array.new
    pairing_hash.map { |k, v| pairing_array << { 
      phrase: k,
      count: v, 
      chapter: chapter_count, 
      source: source.url, 
      } 
    }
    PairingDestination.new(pairing_array).write

    chapter_count += 1
  end
end

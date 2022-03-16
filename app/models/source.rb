class Source < ApplicationRecord
  establish_connection :source

  def each_chapter
    chapter_string = ""
    current_chapter = 0

    text.split("\n").each do |line|
      if line.match(/^Chapter \w+/i)
        completed_chapter_string = chapter_string
        chapter_string = ""
        current_chapter += 1
        yield(completed_chapter_string)
      end

      next if current_chapter.zero? # skip anything before the first chapter
      break if end_of_text?(line) # skip anything after the last line

      chapter_string << line
    end
  end

  def end_of_text?(line)
    line.match(/\*\*\* END OF THE PROJECT GUTENBERG EBOOK/)
  end
end

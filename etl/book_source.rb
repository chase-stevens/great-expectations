require_relative '../config/environment'

class BookSource
  def initialize(text, source)
    @text = text
    @source = source
  end

  def each_chapter
    chapter_string = ""

    text.split("\n").each do |line|
      if line.match(/^Chapter \w+\./)
        completed_chapter_string = chapter_string
        chapter_string = ""
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
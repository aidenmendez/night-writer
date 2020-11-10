require './lib/manager'
require "./lib/manager"

class ReaderManager < Manager
  attr_reader :english_converter

  def initialize(parent, user_input)
    super(parent, user_input)
    @english_v = convert_to_english(@input_file_content) 
  end

  def convert_to_english(braille)
    output_str = ""
    br_rows = []
    translation_keys = []

    braille.each_slice(3) do |br_row|
      br_rows << br_row
    end

    br_rows.each do |br_row|
      translation_keys << create_translation_keys(br_row)
    end
  end

  def create_translation_keys(row)
    translation_keys = []
    line_1 = row[0].gsub("\n", "").scan(/.{2}/)
    line_2 = row[1].gsub("\n", "").scan(/.{2}/)
    line_3 = row[2].gsub("\n", "").scan(/.{2}/)
    
    line_1.each_with_index do |key_chunk_1, index|
      translation_keys << [key_chunk_1, line_2[index], line_3[index]]
    end
    translation_keys
  end
end

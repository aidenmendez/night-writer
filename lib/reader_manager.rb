require './lib/manager'
require "./lib/manager"

class ReaderManager < Manager
  attr_reader :english_converter

  def initialize(parent, user_input)
    super(parent, user_input)
    @output_text = convert_to_english(@input_file_content)
    write_output_file(@output_text)
  end

  def write_output_file(output_file_name)
    file = File.open(output_file_name, "w")
    file.write(@output_text)
    file.close
  end

  def convert_to_english(braille)
    br_rows = slice_into_rows(braille)
    translation_keys = collect_translation_keys(br_rows)
    output_str = translate_keys(translation_keys.flatten(1))
  end

  def slice_into_rows(all_lines)
    br_rows = []
    all_lines.each_slice(3) do |br_row|
      br_rows << br_row
    end
    br_rows
  end

  def collect_translation_keys(rows)
    keys = []
    rows.each do |row|
      keys << create_translation_keys(row)
    end
    keys
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

  def translate_keys(braille_keys)
    characters = ""
    braille_keys.each do |braille_key|
      characters << @translator.keys.key(braille_key)
    end
    characters
  end
end

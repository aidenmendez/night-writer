class Responder
  def confirm_file_created(output_file, input_char_count)
    "Created '#{output_file}' containing #{input_char_count} characters"
  end
end
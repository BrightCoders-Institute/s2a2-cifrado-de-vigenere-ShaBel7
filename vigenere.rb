class Encryptor
    def initialize(original_message, key)
      @original_message = original_message.upcase
      @key = key.upcase
    end
  
    def encrypt
      encrypted_message = ""
      @original_message.each_char.with_index do |char, index|
        original_value = char.ord - 'A'.ord
        key_value = @key[index % @key.length].ord - 'A'.ord
        encrypted_value = (original_value + key_value) % 26
        encrypted_char = (encrypted_value + 'A'.ord).chr
        encrypted_message += encrypted_char
      end
      encrypted_message
    end
  end
  
  # Example usage:
  original_message = "HOLAA"
  key = "SECRETO"
  encryptor = Encryptor.new(original_message, key)
  encrypted_message = encryptor.encrypt
  
  puts "Original message: #{original_message}"
  puts "Key: #{key}"
  puts "Encrypted message: #{encrypted_message}"
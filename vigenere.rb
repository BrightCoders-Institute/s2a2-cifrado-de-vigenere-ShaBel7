# frozen_string_literal: true
# Definimos  una clase "Encryptor"
# Define el método de inialización 'original message,key'
# frozen_string_literal: true
# Vigenere Algorithm

# frozen_string_literal: true

# Vigenere Algorithm
class Encryptor
    def initialize(original_message, key)
      @original_message = original_message.upcase
      @key = key.upcase
    end
  
    def encrypt
      encrypted_message = ''
      @original_message.each_char.with_index do |char, index|
        original_value = char.upcase.ord - 'A'.ord
        key_value = key_value_at(index)
        encrypted_char = encrypt_char(original_value, key_value)
        puts "Char: #{char}, Original Value: #{original_value}, Key Value: #{key_value}, Encrypted Char: #{encrypted_char}"
        encrypted_message += encrypted_char
      end
      encrypted_message
    end
  
    private
  
    def key_value_at(index)
      @key[index % @key.length].upcase.ord - 'A'.ord
    end
  
    def encrypt_char(original_value, key_value)
      encrypted_value = (original_value + key_value) % 26
      encrypted_char = (encrypted_value + 'A'.ord).chr
      puts "Original Value: #{original_value}, Key Value: #{key_value}, Encrypted Value: #{encrypted_value}, Encrypted Char: #{encrypted_char}"
      encrypted_char
    end
  end
  
  # Example usage:
  original_message = 'HOLA'
  key = 'SECRETO'
  encryptor = Encryptor.new(original_message, key)
  encrypted_message = encryptor.encrypt
  
  puts "Original message: #{original_message}"
  puts "Key: #{key}"
  puts "Encrypted message: #{encrypted_message}"
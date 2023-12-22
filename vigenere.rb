# frozen_string_literal: true
# Definimos  una clase "Encryptor"
# Define el método de inialización 'original message,key'
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
      original_value = char.ord - 'A'.ord
      key_value = key_value_at(index)
      encrypted_char = encrypt_char(original_value, key_value)
      encrypted_message += encrypted_char
    end
    encrypted_message
  end

  private

  def key_value_at(index)
    @key[index % @key.length].ord - 'A'.ord
  end

  def encrypt_char(original_value, key_value)
    encrypted_value = (original_value + key_value) % 26
    (encrypted_value + 'A'.ord).chr
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

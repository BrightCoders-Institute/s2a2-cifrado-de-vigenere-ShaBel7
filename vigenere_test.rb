# test_encryptor.rb
require 'minitest/autorun'
require_relative 'vigenere.rb'

class TestEncryptor < Minitest::Test
  def test_encrypt
    # test 1
    original_message = "HOLAA"
    key = "SECRETO"
    encryptor = Encryptor.new(original_message, key)
    encrypted_message = encryptor.encrypt

    assert_equal("ZSNRE", encrypted_message)


    #test 2
    original_message = "RUBY"
    key = "COD"
    encryptor = Encryptor.new(original_message, key)
    encrypted_message = encryptor.encrypt

    assert_equal("TIEA", encrypted_message)

    #test 3
    original_message = "ADIOS"
    key = "BYE"
    encryptor = Encryptor.new(original_message, key)
    encrypted_message = encryptor.encrypt

    assert_equal("BBMPQ", encrypted_message)

    #test 4
    original_message = "HOLA"
    key = "SOSPE"
    encryptor = Encryptor.new(original_message, key)
    encrypted_message = encryptor.encrypt

    assert_equal("ZCDP", encrypted_message)

  end
end
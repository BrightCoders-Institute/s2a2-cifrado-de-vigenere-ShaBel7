Este código implementa el algoritmo de cifrado de Vigenère en Ruby. A continuación, se explica línea por línea utilizando formato Markdown:

```ruby
# frozen_string_literal: true
```

- `# frozen_string_literal: true`: Esta línea indica que las cadenas de texto en el archivo son literales congeladas, lo que significa que no se pueden modificar después de ser creadas. Esto es una buena práctica para evitar errores inadvertidos al modificar cadenas de texto.

```ruby
# Vigenere Algorithm
class Encryptor
  def initialize(original_message, key)
    @original_message = original_message.upcase
    @key = key.upcase
  end
```

- `# Vigenere Algorithm`: describe el propósito del código.
- `class Encryptor`: Define una clase llamada `Encryptor`.
- `def initialize(original_message, key)`: Define un método de inicialización que toma dos parámetros, `original_message` y `key`. Este método se llama cuando se crea una nueva instancia de la clase `Encryptor`.
- `@original_message = original_message.upcase`: Convierte el mensaje original a mayúsculas y lo asigna a la variable de instancia `@original_message`.
- `@key = key.upcase`: Convierte la clave a mayúsculas y la asigna a la variable de instancia `@key`.

```ruby
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
```

- `def encrypt`: Define un método llamado `encrypt` que realiza el cifrado de Vigenère.
- `encrypted_message = ''`: Inicializa una cadena vacía llamada `encrypted_message` para almacenar el mensaje cifrado.
- `@original_message.each_char.with_index do |char, index|`: Itera sobre cada carácter del mensaje original junto con su índice.
- `original_value = char.upcase.ord - 'A'.ord`: Calcula el valor numérico correspondiente al carácter original restando el código ASCII de 'A'.
- `key_value = key_value_at(index)`: Llama al método privado `key_value_at` para obtener el valor numérico correspondiente al carácter de la clave en el índice actual.
- `encrypted_char = encrypt_char(original_value, key_value)`: Llama al método privado `encrypt_char` para obtener el carácter cifrado.
- `puts "Char: #{char}, Original Value: #{original_value}, Key Value: #{key_value}, Encrypted Char: #{encrypted_char}"`: Imprime información detallada sobre cada paso del cifrado.
- `encrypted_message += encrypted_char`: Agrega el carácter cifrado a la cadena `encrypted_message`.

```ruby
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
```

- `private`: Marca las siguientes definiciones de métodos como métodos privados, lo que significa que solo pueden ser llamados internamente por la clase.
- `def key_value_at(index)`: Define un método privado llamado `key_value_at` que toma un índice y devuelve el valor numérico correspondiente al carácter de la clave en ese índice.
- `def encrypt_char(original_value, key_value)`: Define un método privado llamado `encrypt_char` que toma dos valores numéricos y devuelve el carácter cifrado.

```ruby
# Example usage:
original_message = 'HOLA'
key = 'SECRETO'
encryptor = Encryptor.new(original_message, key)
encrypted_message = encryptor.encrypt

puts "Original message: #{original_message}"
puts "Key: #{key}"
puts "Encrypted message: #{encrypted_message}"
```

- Comentario que indica que a continuación se muestra un ejemplo de uso.
- `original_message = 'HOLA'`: Define una variable llamada `original_message` con el valor "HOLA".
- `key = 'SECRETO'`: Define una variable llamada `key` con el valor "SECRETO".
- `encryptor = Encryptor.new(original_message, key)`: Crea una nueva instancia de la clase `Encryptor` con el mensaje original y la clave.
- `encrypted_message = encryptor.encrypt`: Llama al método `encrypt` para cifrar el mensaje original y guarda el resultado en `encrypted_message`.
- `puts "Original message: #{original_message}"`: Imprime el mensaje original.
- `puts "Key: #{key}"`: Imprime la clave.
- `puts "Encrypted message: #{encrypted_message}"`: Imprime el mensaje cifrado.

En resumen, este código implementa un cifrado de Vigenère en Ruby utilizando una clase llamada `Encryptor`. El código también incluye información detallada de depuración mediante la impresión de valores en cada paso del cifrado.
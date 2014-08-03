livros = Book.all
autores = Author.all

puts 'Gerando slugs para livros'
livros.each do |livro|
  puts "Gerando slug do livro #{livro.name}"
  livro.slug = livro.name.parameterize
  livro.save
end
puts 'Fim da geração de slugs dos livros'

puts ' '

puts 'Gerando slugs para autores'
autores.each do |autor|
  puts "Gerando slug do autor #{autor.name}"
  autor.slug = autor.name.parameterize
  autor.save
end
puts 'Gerando slugs para autores'
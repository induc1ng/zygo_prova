require 'rails_helper'
require 'faker'

RSpec.describe Book, :type => :model do
    # Title #
    # Todo livro deve conter um titulo com pelo menos 2 caracteres #
    context "title" do
        it "is empty" do
            book_test = Book.new ({ title: nil,author: 'Fernando Pessoa', description: "Um livro com varias paginas e com mais de 10 caracteres", image:"url.jpg" })
            expect(book_test).to_not be_valid
        end

        it "has less than 2 characters" do
            book_test = Book.new({title:Faker::Name.name[0..3], author: 'Fernando Pessoa', description: "Um livro com varias paginas e com mais de 10 caracteres", image:"url.jpg" })
            expect(book_test.title).to have_attributes(size: (be > 2))
        end
    end

    # Autor #
    # Todo livro deve conter um autor e nao ser nulo #
    context "author" do
        it "is empty" do
            book_test = Book.new ({ title: "Teste Livro",author: nil, description: "Um livro com varias paginas e com mais de 10 caracteres", image:"url.jpg" })
            expect(book_test).to_not be_valid
        end
    end

    # Image #
    # Toda imagem deve possuir uma URL correta com extensao em JPG ou PNG e nao ser nula#
    context "image" do
        it "has wrong extension (JPG or PNG)" do
            regex = "([^\\s]+(\\.(?i)(jpe?g|png))$)"; 
            book_test = Book.new ({ title: nil,author: 'Fernando Pessoa', description: "Um livro com varias paginas e com mais de 10 caracteres", image:"url.jpg" })
            expect(book_test.image).to match(regex)
        end
    end

    # Descricao #
    # Todo livro deve conter uma descricao maior que 10 caracteres #
    context "description" do
        it "is empty" do
            book_test = Book.new ({ title: "Livro Teste",author: 'Fernando Pessoa', description: nil, image:"url.jpg" })
            expect(book_test).to_not be_valid
        end

        it "has less than 10 characters" do
            book_test = Book.new({title:Faker::Name.name[0..1], author: 'Fernando Pessoa', description: "Um livro com varias paginas e com mais de 10 caracteres", image:"url.jpg" })
            expect(book_test.description).to have_attributes(size: (be >= 10))
        end
    end

    
end
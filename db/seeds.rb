# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: "a@a",
    password: "aaaaaa"
)


Genre.create! ([
    {name: 'ケーキ'},
    {name: 'プリン'},
    {name: '焼き菓子'}
    ])

Item.create!([
        {
            name: 'チョコレートケーキ',
            introduction: 'チョコのケーキ',
            tax_excluded_price: 300,
            is_sale: true,
            genre_id: Genre.find_by(name: 'ケーキ').id,
            image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/1.jpg")), filename: '1.jpg')
            
        },
        {
            name: 'キャラメルプリン',
            introduction: 'キャラメルのプリン',
            tax_excluded_price: 200,
            is_sale: true,
            genre_id: Genre.find_by(name: 'プリン').id, 
            image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/2.jpg")), filename: '2.jpg')
        },
        {
            name: 'シュークリーム',
            introduction: '生クリーム入ってます',
            tax_excluded_price: 150,
            is_sale: false,
            genre_id: Genre.find_by(name: '焼き菓子').id,
            image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/3.jpg")), filename: '3.jpg')
           
        }
])


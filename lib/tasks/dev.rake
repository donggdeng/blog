namespace :dev do

    task fake: :environment do
      
      Article.delete_all
  
      1000.times do |i|
        topic = Article.create!( title:  Faker::Lorem.sentence.titleize,
                               content:  Faker::Lorem.paragraph(sentence_count: rand(10..100)),
                               author: Faker::Name.name,
                               is_published: true,
                                publish_date: Faker::Date.between(from: '2000-01-01', to: '2021-08-01')
                            )
        puts "Generate Article #{i}"
      end
    end
  
  end
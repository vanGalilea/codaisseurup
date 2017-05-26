Photo.destroy_all
Theme.destroy_all
Event.destroy_all
Profile.destroy_all
User.destroy_all
Registration.destroy_all

steve = User.create!(email: "z.galili@icloud.com", password: "abc123")
sem = User.create!(email: "sem@icloud.com", password: "abc123")

sport = Theme.create(name: "Sport")
rc = Theme.create(name: "RC flying")
politics = Theme.create(name: "Politics")
men = Theme.create(name: "For men")
women = Theme.create(name: "For women")
cooking = Theme.create(name: "Cooking")
baking = Theme.create(name: "Baking")

photo1 = Photo.create(remote_image_url: "http://res.cloudinary.com/dqmqi1nxq/image/upload/v1495704728/9eafa34f479062a8167142b20b6d1aa5-1445805350_wzjr9m.jpg")
photo2 = Photo.create(remote_image_url: "http://res.cloudinary.com/dqmqi1nxq/image/upload/v1495704683/HHB8_czizxo.jpg")

photo3 = Photo.create(remote_image_url: "http://res.cloudinary.com/dqmqi1nxq/image/upload/v1495704499/Hobbyking_Live_AU_2017_hseo2b.jpg")
photo4 = Photo.create(remote_image_url: "http://res.cloudinary.com/dqmqi1nxq/image/upload/v1495704533/IMG_1721_zrwmxg.jpg")

photo5 = Photo.create(remote_image_url: "http://res.cloudinary.com/dqmqi1nxq/image/upload/v1495704580/vbkzspqx-1476093883_eneisi.jpg")
photo6 = Photo.create(remote_image_url: "http://res.cloudinary.com/dqmqi1nxq/image/upload/v1495704603/Institute-of-Politics-Debate-Failure-of-the-Political-Establishment-010_cf3fyz.jpg")

event1 = Event.create!(name: "Drone Flying Event", description:"In response to the growing popularity of remote controlled aircraft,
 helicopters and multicopters (aka UAV or drones), Burning Man has formed a new team: Remote Control Black Rock City (RCBRC)
 registration process, have all RC pilots be familiar with flying in the city, and make it safer for all Burning Man
 participants.", location: "Utrecht fly club", price: 4.99, capacity: 250, includes_food: true, includes_drinks: true,
 starts_at: Time.now, ends_at: Time.now, active: true, user: steve, themes: [sport, rc], photos: [photo3, photo4])

 event2 = Event.create!(name: "Debate about nonesense", description:"As a high schooler I vacillated between
 believing that having to wear the itchy green school jumper was malarkey, to actually enjoying not having to
 think about outfits. Sure, I likely harboured vague notions of wanting to “express” the blackness of my soul
 through apparel I’d self-selected, but even then I knew that having to do so daily would have soon worn thin.",
 location: "Ledien city hall", price: 0.00, capacity: 250, includes_food: false, includes_drinks: false,
  starts_at: Time.now, ends_at: Time.now, active: true, user: steve, themes: [men, politics], photos: [photo5, photo6])

  event3 = Event.create!(name: "The great Dutch bake off", description:"Given all the downsides, experts say we
  should be eating less sugar. New federal nutrition guidelines are due out before the year’s end, and they are
  expected to cap added sugars at 12 teaspoons (50 grams a day). The FDA is also redesigning food labels to clearly
  show how much sugar has been added to foods.", location: "Huis ter Heide valley", price: 9.99, capacity: 50, includes_food: true,
  includes_drinks: false, starts_at: Time.now, ends_at: Time.now, active: true, user: sem, themes: [women, cooking, baking], photos: [photo1, photo2])

  Registration.create!(event: event3, user: steve, price: 5.5, status: "almost full")
  Registration.create!(event: event2, user: sem, price: 5.4, status: "almost full")

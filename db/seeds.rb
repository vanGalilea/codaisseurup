User.destroy_all

steve = User.create(email: "z.galili@icloud.com", password: "abc123")

event = Event.create(name: "Drone Flying Event", description:"In response to the growing popularity of remote controlled aircraft,
 helicopters and multicopters (aka UAV or drones), Burning Man has formed a new team: Remote Control Black Rock City (RCBRC)
 registration process, have all RC pilots be familiar with flying in the city, and make it safer for all Burning Man
 participants.", location: "Utrecht fly club", price: 4.99, capacity: 250, includes_food: true, includes_drinks: true,
 starts_at: Time.now, ends_at: Time.now, active: true, user: steve)

Season.delete_all
League.delete_all
Location.delete_all
Roster.delete_all
PlayerStat.delete_all
Game.delete_all
Team.delete_all
User.delete_all


u1 = User.create!(email: "chris@chris.com", password: "chris", first_name: "Chris", last_name: "Crane")
u2 = User.create!(email: "david@david.com", password: "david", first_name: "David", last_name: "Crane")
u3 = User.create!(email: "doug@doug.com", password: "doug", first_name: "Doug", last_name: "Crane")
u4 = User.create!(email: "andrew@andrew.com", password: "andrew", first_name: "Andrew", last_name: "Crane")
u5 = User.create!(email: "smacker@smacker.com", password: "smacker", first_name: "Paul", last_name: "Smachetti")
u6 = User.create!(email: "darin@darin.com", password: "darin", first_name: "Darin", last_name: "Lane")
u7 = User.create!(email: "ian@ian.com", password: "ian", first_name: "Ian", last_name: "Roberts")
u8 = User.create!(email: "josh@josh.com", password: "josh", first_name: "Josh", last_name: "Roberts")
u9 = User.create!(email: "tim@tim.com", password: "tim", first_name: "Tim", last_name: "Burns")
u10 = User.create!(email: "mike@mike.com", password: "mike", first_name: "Mike", last_name: "Daley")
u11 = User.create!(email: "zig@zig.com", password: "zig", first_name: "Dave", last_name: "Ziggy")


loc1 = Location.create!(name: "Boys and Girls Club", street: "16 Melville St", city: "Pittsfield", state: "MA", zip: "01201")
loc2 = Location.create!(name: "Vietnam Veterans Memorial Rink", street: "1267 Church St", city: "North Adams", state: "MA", zip: "01247")

leag1 = League.create!(name: "Beer League", user: u5, date_created: "2013-10-01", location_id: loc1.id)
leag2 = League.create!(name: "Sunday Night League", user: u11, date_created:"2010-10-10", location_id: loc2.id)

t1 = Team.create!(name: "Beer Kings", user_id: u5.id, date_created: "2013-10-02")
t2 = Team.create!(name: "Berkshire Bruins", user_id: u2.id, date_created: "2013-10-02")
t3 = Team.create!(name: "The Shamrocks", user_id: u6.id, date_created: "2013-10-02")
t4 = Team.create!(name: "The Whalers", user_id: u4.id, date_created: "2013-10-02")
t5 = Team.create!(name: "Chicks Hockey", user_id: u3.id, date_created: "2010-10-03")
t6 = Team.create!(name: "Chris' Team", user_id: u1.id, date_created: "2010-10-03")

s1 = Season.create!(team: t1, league: leag1, start_date: "2015-10-01", end_date: "2016-05-01")
s2 = Season.create!(team: t2, league: leag1, start_date: "2015-10-01", end_date: "2016-05-01")
s3 = Season.create!(team: t3, league: leag1, start_date: "2015-10-01", end_date: "2016-05-01")
s4 = Season.create!(team: t4, league: leag1, start_date: "2015-10-01", end_date: "2016-05-01")
s5 = Season.create!(team: t5, league: leag2, start_date: "2015-10-20", end_date: "2016-05-20")
s6 = Season.create!(team: t6, league: leag2, start_date: "2015-10-20", end_date: "2016-05-20")

#r1 = Roster.create!(team: t1, user: u1)
r2 = Roster.create!(team: t1, user_id: u5.id)
r3 = Roster.create!(team: t1, user_id: u7.id)
r4 = Roster.create!(team: t1, user_id: u8.id)
r5 = Roster.create!(team: t1, user_id: u9.id)
r6 = Roster.create!(team: t3, user_id: u6.id)
r7 = Roster.create!(team: t3, user_id: u10.id)
r8 = Roster.create!(team: t2, user_id: u2.id)
r9 = Roster.create!(team: t4, user_id: u4.id)
r10 = Roster.create!(team: t5, user_id: u3.id)
r11 = Roster.create!(team: t6, user_id: u1.id)

g1 = Game.create!(date: "2015-11-09", time: "7:20", home_team: t1, away_team: t3, home_goals: 7, away_goals: 11)
g2 = Game.create!(date: "2015-11-13", time: "8:00", home_team: t2, away_team: t3, home_goals: 7, away_goals: 11)
g3 = Game.create!(date: "2015-11-14", time: "7:30", home_team: t4, away_team: t3, home_goals: 7, away_goals: 11)
g4 = Game.create!(date: "2015-11-20", time: "7:30", home_team: t2, away_team: t1, home_goals: 7, away_goals: 11)
g5 = Game.create!(date: "2015-12-01", time: "7:40", home_team: t1, away_team: t4, home_goals: 7, away_goals: 11)
g6 = Game.create!(date: "2015-12-02", time: "7:20", home_team: t4, away_team: t3, home_goals: 7, away_goals: 11)
g6 = Game.create!(date: "2016-01-03", time: "9:00", home_team: t1, away_team: t3, home_goals: 7, away_goals: 11)

pstat1 = PlayerStat.create!(game_id: g1.id, user_id: u9.id, team_id: t1.id, goals: 2, assists: 3, penalty_mins: 2)
pstat2 = PlayerStat.create!(game_id: g1.id, user_id: u8.id, team_id: t1.id, goals: 3, assists: 1, penalty_mins: 0)
pstat1 = PlayerStat.create!(game_id: g1.id, user_id: u6.id, team_id: t3.id, goals: 5, assists: 2, penalty_mins: 2)
pstat1 = PlayerStat.create!(game_id: g1.id, user_id: u10.id, team_id: t3.id, goals: 1, assists: 2, penalty_mins: 4)

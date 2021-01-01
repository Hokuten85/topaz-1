select * from char_effects
delete from char_effects

select * from char_equip
delete from char_equip

select * from char_exp
update char_exp
set war = 0, mnk = 0, whm = 0, blm = 0, rdm = 0, thf = 0, pld = 0, drk = 0, bst = 0, brd = 0, rng = 0, sam = 0, nin = 0, drg = 0, smn = 0, geo = 0, run = 0, merits = 0, limits = 0

select * from char_inventory
delete from char_inventory where itemid != 65535
update char_inventory
set quantity = 10000

select * from char_jobs
update char_jobs
set unlocked = 126, war = 1, mnk = 1, whm = 1, blm = 1, rdm = 1, thf = 1, pld = 1, drk = 1, bst = 1, brd = 1, rng = 1, sam = 1, nin = 1, drg = 1, smn = 1, geo = 1, run = 1

select * from char_look

select * from char_merit

select * from char_pet
select * from char_pet_name
select * from char_points
update char_points
set bastok_cp = 0, sandoria_supply = 12582880, bastok_supply = 12582880, windurst_supply = 12582880

select * from char_profile
select * from char_skills
delete from char_skills

select * from char_spells
delete from char_spells

select * from char_stats
update char_stats
set hp = 24, mp = 28, nameflags = 0, mjob = 1, sjob = 0, death = 0, title = 206, mlvl = 1, slvl = 0

select * from char_storage
select * from char_style
select * from char_vars
delete from char_vars

select * from char_weapon_skill_points
select * from chars
update chars
set nation = 1, pos_zone = 235, pos_prevzone = 235, pos_rot = 15, pos_x = -280, pos_y = -12.020, pos_z = -91, home_zone = 235, home_rot = 15, home_x = -280, home_y = -12, home_z = -91, quests = null, keyitems = null, titles = null, zones = null, playtime = 0

insert into char_skills select charid, 48, 1000, 15 from chars;
insert into char_skills select charid, 49, 1000, 15 from chars;
insert into char_skills select charid, 50, 1000, 15 from chars;
insert into char_skills select charid, 51, 1000, 15 from chars;
insert into char_skills select charid, 52, 1000, 15 from chars;
insert into char_skills select charid, 53, 1000, 15 from chars;
insert into char_skills select charid, 54, 1000, 15 from chars;
insert into char_skills select charid, 55, 1000, 15 from chars;
insert into char_skills select charid, 56, 1000, 15 from chars;
insert into char_skills select charid, 57, 1000, 15 from chars;

select * from linkshells
select * from char_inventory2 where charid = 21828

insert into char_inventory
select b.charid, a.location, a.slot, a.itemid, a.quantity, a.bazaar, a.signature, a.extra
from char_inventory2 a
INNER JOIN chars b
	ON 1 = 1
where a.charid = 21828 and itemid = 513
and b.charid != 21828

select * from char_inventory
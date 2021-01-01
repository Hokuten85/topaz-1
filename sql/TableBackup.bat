For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)

B:
cd "B:\FFIvalice\Database Backups"
mkdir %mydate%
cd %mydate%

"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u ******** -p******** --default-character-set=utf8 --result-file=auction_house.sql tpzdb auction_house
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u ******** -p******** --default-character-set=utf8 --result-file=chars.sql tpzdb chars
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u ******** -p******** --default-character-set=utf8 --result-file=accounts.sql tpzdb accounts
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u ******** -p******** --default-character-set=utf8 --result-file=accounts_banned.sql tpzdb accounts_banned
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u ******** -p******** --default-character-set=utf8 --result-file=char_effects.sql tpzdb char_effects
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u ******** -p******** --default-character-set=utf8 --result-file=char_equip.sql tpzdb char_equip
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u ******** -p******** --default-character-set=utf8 --result-file=char_exp.sql tpzdb char_exp
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u ******** -p******** --default-character-set=utf8 --result-file=char_inventory.sql tpzdb char_inventory
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u ******** -p******** --default-character-set=utf8 --result-file=char_jobs.sql tpzdb char_jobs
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u ******** -p******** --default-character-set=utf8 --result-file=char_look.sql tpzdb char_look
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u ******** -p******** --default-character-set=utf8 --result-file=char_pet.sql tpzdb char_pet
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u ******** -p******** --default-character-set=utf8 --result-file=char_pet_name.sql tpzdb char_pet_name
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u ******** -p******** --default-character-set=utf8 --result-file=char_points.sql tpzdb char_points
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u ******** -p******** --default-character-set=utf8 --result-file=char_profile.sql tpzdb char_profile
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u ******** -p******** --default-character-set=utf8 --result-file=char_skills.sql tpzdb char_skills
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u ******** -p******** --default-character-set=utf8 --result-file=char_spells.sql tpzdb char_spells
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u ******** -p******** --default-character-set=utf8 --result-file=char_stats.sql tpzdb char_stats
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u ******** -p******** --default-character-set=utf8 --result-file=char_storage.sql tpzdb char_storage
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u ******** -p******** --default-character-set=utf8 --result-file=char_vars.sql tpzdb char_vars
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u ******** -p******** --default-character-set=utf8 --result-file=char_weapon_skill_points.sql tpzdb char_weapon_skill_points
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u ******** -p******** --default-character-set=utf8 --result-file=conquest_system.sql tpzdb conquest_system
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u ******** -p******** --default-character-set=utf8 --result-file=delivery_box.sql tpzdb delivery_box
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u ******** -p******** --default-character-set=utf8 --result-file=linkshells.sql tpzdb linkshells
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u ******** -p******** --default-character-set=utf8 --result-file=tpzdb.sql tpzdb
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u ******** -p******** --default-character-set=utf8 --result-file=npc_list.sql tpzdb npc_list
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump" --complete-insert --hex-blob -u ******** -p******** --default-character-set=utf8 --result-file=char_merits.sql tpzdb char_merit
-----------------------------------
-- Area: 
-- NPC:  Pandemonium_Warden
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
 
	LAMP = mob:getID();
	
	if (LAMP == 17056168) then
		for i = LAMP+2, LAMP+9, 1 do 
			SpawnMob(i,180):updateEnmity(target);
		end
	end

end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob,target) 
	
	mobID = mob:getID();
	-- changing skin and lamps change skin with him
	-- only needs skills so that will trigger his next skin change and to trigger on his last spawn the change of the lamps to avatars
	-- astral needs to trigger avatar skin change at 25% 50% and 75% i only added 50% for now till the skills are in and i or somebody else can change the script a bit
	if(mob:getHP() < 20000 and mob:getSkinID() == 13) then
		mob:changeSkin(14);
		GetMobByID(17056170):changeSkin(22);
		GetMobByID(17056171):changeSkin(22);
		GetMobByID(17056172):changeSkin(22);
		GetMobByID(17056173):changeSkin(22);
		GetMobByID(17056174):changeSkin(22);
		GetMobByID(17056175):changeSkin(22);
		GetMobByID(17056176):changeSkin(22);
		GetMobByID(17056177):changeSkin(22);
	elseif(mob:getHP() < 40000 and mob:getSkinID() == 12) then
		mob:changeSkin(13);
		GetMobByID(17056170):changeSkin(21);
		GetMobByID(17056171):changeSkin(21);
		GetMobByID(17056172):changeSkin(21);
		GetMobByID(17056173):changeSkin(21);
		GetMobByID(17056174):changeSkin(21);
		GetMobByID(17056175):changeSkin(21);
		GetMobByID(17056176):changeSkin(21);
		GetMobByID(17056177):changeSkin(21);
	elseif(mob:getHP() < 55000 and mob:getSkinID() == 11) then
		mob:changeSkin(12);
		GetMobByID(17056170):changeSkin(20);
		GetMobByID(17056171):changeSkin(20);
		GetMobByID(17056172):changeSkin(20);
		GetMobByID(17056173):changeSkin(20);
		GetMobByID(17056174):changeSkin(20);
		GetMobByID(17056175):changeSkin(20);
		GetMobByID(17056176):changeSkin(20);
		GetMobByID(17056177):changeSkin(20);
	elseif(mob:getHP() < 70000 and mob:getSkinID() == 10) then
		mob:changeSkin(11);
		GetMobByID(17056170):changeSkin(19);
		GetMobByID(17056171):changeSkin(19);
		GetMobByID(17056172):changeSkin(19);
		GetMobByID(17056173):changeSkin(19);
		GetMobByID(17056174):changeSkin(19);
		GetMobByID(17056175):changeSkin(19);
		GetMobByID(17056176):changeSkin(19);
		GetMobByID(17056177):changeSkin(19);
	elseif(mob:getHP() < 85000 and mob:getSkinID() == 9) then
		mob:changeSkin(10);
		GetMobByID(17056170):changeSkin(18);
		GetMobByID(17056171):changeSkin(18);
		GetMobByID(17056172):changeSkin(18);
		GetMobByID(17056173):changeSkin(18);
		GetMobByID(17056174):changeSkin(18);
		GetMobByID(17056175):changeSkin(18);
		GetMobByID(17056176):changeSkin(18);
		GetMobByID(17056177):changeSkin(18);
	elseif(mob:getHP() < 100000 and mob:getSkinID() == 8) then
		mob:changeSkin(9);
		GetMobByID(17056170):changeSkin(17);
		GetMobByID(17056171):changeSkin(17);
		GetMobByID(17056172):changeSkin(17);
		GetMobByID(17056173):changeSkin(17);
		GetMobByID(17056174):changeSkin(17);
		GetMobByID(17056175):changeSkin(17);
		GetMobByID(17056176):changeSkin(17);
		GetMobByID(17056177):changeSkin(17);
	elseif(mob:getHP() < 110000 and mob:getSkinID() == 7) then
		mob:changeSkin(8);
	elseif(mob:getHP() < 120000 and mob:getSkinID() == 6) then
		mob:changeSkin(7);
	elseif(mob:getHP() < 130000 and mob:getSkinID() == 5) then
		mob:changeSkin(6);
	elseif(mob:getHP() < 140000 and mob:getSkinID() == 15) then
		mob:changeSkin(5);
		GetMobByID(17056170):changeSkin(16);
		GetMobByID(17056171):changeSkin(16);
		GetMobByID(17056172):changeSkin(16);
		GetMobByID(17056173):changeSkin(16);
		GetMobByID(17056174):changeSkin(16);
		GetMobByID(17056175):changeSkin(16);
		GetMobByID(17056176):changeSkin(16);
		GetMobByID(17056177):changeSkin(16);
	elseif(mobID == 17056168 and mob:getHP() > 140000) then
		mob:changeSkin(15);
	elseif(mobID == 17056169 and mob:getHP() < ((mob:getMaxHP() / 10) * 5)) then
		GetMobByID(17056178):changeSkin(23);
		GetMobByID(17056179):changeSkin(24);
		GetMobByID(17056180):changeSkin(25);
		GetMobByID(17056181):changeSkin(26);
		GetMobByID(17056182):changeSkin(27);
		GetMobByID(17056183):changeSkin(28);
		GetMobByID(17056184):changeSkin(29);
		GetMobByID(17056185):changeSkin(30);
		GetMobByID(17056186):changeSkin(31);
	end
	
end;


-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

	mobID = mob:getID();
	-- spawns last form and lamps
	if(mobID == 17056168) then
		SpawnMob(17056169,180):updateEnmity(killer);
		SpawnMob(17056178,180):updateEnmity(killer);
		SpawnMob(17056179,180):updateEnmity(killer);
		SpawnMob(17056180,180):updateEnmity(killer);
		SpawnMob(17056181,180):updateEnmity(killer);
		SpawnMob(17056182,180):updateEnmity(killer);
		SpawnMob(17056183,180):updateEnmity(killer);
		SpawnMob(17056184,180):updateEnmity(killer);
		SpawnMob(17056185,180):updateEnmity(killer);
		SpawnMob(17056186,180):updateEnmity(killer);
	end

end;
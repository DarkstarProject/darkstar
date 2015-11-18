-----------------------------------
-- Area: Dynamis Beaucedine
-- NPC:  Angra Mainyu
-- Mega Boss
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
	
	SpawnMob(17326082):updateEnmity(target); -- Fire_Pukis
	SpawnMob(17326083):updateEnmity(target); -- Poison_Pukis
	SpawnMob(17326084):updateEnmity(target); -- Wind_Pukis
	SpawnMob(17326085):updateEnmity(target); -- Petro_Pukis
	
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
	
	if (GetMobAction(17326082) == 0 and GetMobAction(17326279) ~= 0) then
		SpawnMob(17326082):updateEnmity(target);
	end
	if (GetMobAction(17326083) == 0 and GetMobAction(17326468) ~= 0) then
		SpawnMob(17326083):updateEnmity(target);
	end
	if (GetMobAction(17326084) == 0 and GetMobAction(17326353) ~= 0) then
		SpawnMob(17326084):updateEnmity(target);
	end
	if (GetMobAction(17326085) == 0 and GetMobAction(17326207) ~= 0) then
		SpawnMob(17326085):updateEnmity(target);
	end
	
end;

-- Return the selected spell ID.
function onMonsterMagicPrepare(mob, target)
    
	if (mob:getHPP() <= 25) then
		return 244; -- Death
	else
		-- Can cast Blindga, Death, Graviga, Silencega, and Sleepga II.
		-- Casts Graviga every time before he teleports.
		
		rnd = math.random();
		
		if (rnd < 0.2) then
			return 361; -- Blindga
		elseif (rnd < 0.4) then
			 return 244; -- Death
		elseif (rnd < 0.6) then
			
			return 366; -- Graviga
		elseif (rnd < 0.8) then
			return 274; -- Sleepga II
		else
			return 359; -- Silencega
		end
	end
    
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	killer:addTitle(DYNAMISBEAUCEDINE_INTERLOPER); -- Add title
	killer:setVar("DynaBeaucedine_Win",1);
	
	if (killer:hasKeyItem(HYDRA_CORPS_INSIGNIA) == false) then
		killer:addKeyItem(HYDRA_CORPS_INSIGNIA);
		killer:messageSpecial(KEYITEM_OBTAINED,HYDRA_CORPS_INSIGNIA);
	end
	
end;

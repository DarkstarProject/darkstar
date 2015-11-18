-----------------------------------
-- Area: Batallia Downs
-- NPC:  Weeping Willow
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
	if (mob:getHP() <= mob:getMaxHP()/2 and GetServerVariable("NM-SpecialWeepWillowSapSpawn") < 1) then
		SpawnMob(17207303,600):updateEnmity(target);
		SpawnMob(17207304,600):updateEnmity(target);
		SpawnMob(17207305,600):updateEnmity(target);
		SpawnMob(17207306,600):updateEnmity(target);
		SpawnMob(17207307,600):updateEnmity(target);
		SetServerVariable("NM-SpecialWeepWillowSapSpawn",1);
	end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	local JACK = 17207308;
	SpawnMob(JACK,600):updateEnmity(killer);
	GetMobByID(JACK):setPos( mob:getXPos(), mob:getYPos(), mob:getZPos(), 0);
	SetServerVariable("NM-SpecialWeepWillowSapSpawn",0);
end;


-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
	SetServerVariable("[NM-Special]WeepWillowSapSpawn",0);
end;
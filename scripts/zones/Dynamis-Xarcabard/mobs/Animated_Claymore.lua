-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Animated_Claymore
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob,target)
	mob:addMod(MOD_STUNRES,75); -- Not full resist
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

	if(GetServerVariable("[DynaXarcabard]Boss_Trigger") == 32767) then
		SetDropRate(102,1574,100);
	else
		SetDropRate(102,1574,0);
	end
	
	SpawnMob(17330365,120):updateEnmity(target);
	SpawnMob(17330366,120):updateEnmity(target);
	SpawnMob(17330367,120):updateEnmity(target);
	SpawnMob(17330372,120):updateEnmity(target);
	SpawnMob(17330373,120):updateEnmity(target);
	SpawnMob(17330374,120):updateEnmity(target);

end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	DespawnMob(17330365);
	DespawnMob(17330366);
	DespawnMob(17330367);
	DespawnMob(17330372);
	DespawnMob(17330373);
	DespawnMob(17330374);
	
end;
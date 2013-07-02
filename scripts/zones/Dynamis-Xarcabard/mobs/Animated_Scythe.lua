-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Animated_Scythe
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
		SetDropRate(112,1577,100);
	else
		SetDropRate(112,1577,0);
	end
	
	SpawnMob(17330420,120):updateEnmity(target);
	SpawnMob(17330421,120):updateEnmity(target);
	SpawnMob(17330422,120):updateEnmity(target);
	SpawnMob(17330432,120):updateEnmity(target);
	SpawnMob(17330433,120):updateEnmity(target);
	SpawnMob(17330434,120):updateEnmity(target);

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
	
	DespawnMob(17330420);
	DespawnMob(17330421);
	DespawnMob(17330422);
	DespawnMob(17330432);
	DespawnMob(17330433);
	DespawnMob(17330434);
	
end;
-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Animated_Great_Axe
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
		SetDropRate(104,1576,100);
	else
		SetDropRate(104,1576,0);
	end
	
	SpawnMob(17330383,120):updateEnmity(target);
	SpawnMob(17330384,120):updateEnmity(target);
	SpawnMob(17330385,120):updateEnmity(target);
	SpawnMob(17330395,120):updateEnmity(target);
	SpawnMob(17330396,120):updateEnmity(target);
	SpawnMob(17330397,120):updateEnmity(target);

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
	
	DespawnMob(17330383);
	DespawnMob(17330384);
	DespawnMob(17330385);
	DespawnMob(17330395);
	DespawnMob(17330396);
	DespawnMob(17330397);
	
end;
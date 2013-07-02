-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Animated_Knuckles
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
		SetDropRate(108,1571,100);
	else
		SetDropRate(108,1571,0);
	end
	
	SpawnMob(17330309,120):updateEnmity(target);
	SpawnMob(17330310,120):updateEnmity(target);
	SpawnMob(17330311,120):updateEnmity(target);
	SpawnMob(17330319,120):updateEnmity(target);
	SpawnMob(17330320,120):updateEnmity(target);
	SpawnMob(17330321,120):updateEnmity(target);

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
	
	DespawnMob(17330309);
	DespawnMob(17330310);
	DespawnMob(17330311);
	DespawnMob(17330319);
	DespawnMob(17330320);
	DespawnMob(17330321);
	
end;
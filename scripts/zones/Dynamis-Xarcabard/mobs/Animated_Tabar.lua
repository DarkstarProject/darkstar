-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Animated_Tabar
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
		SetDropRate(116,1575,100);
	else
		SetDropRate(116,1575,0);
	end
	
	SpawnMob(17330380,120):updateEnmity(target);
	SpawnMob(17330381,120):updateEnmity(target);
	SpawnMob(17330382,120):updateEnmity(target);
	SpawnMob(17330392,120):updateEnmity(target);
	SpawnMob(17330393,120):updateEnmity(target);
	SpawnMob(17330394,120):updateEnmity(target);

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
	
	DespawnMob(17330380);
	DespawnMob(17330381);
	DespawnMob(17330382);
	DespawnMob(17330392);
	DespawnMob(17330393);
	DespawnMob(17330394);
	
end;
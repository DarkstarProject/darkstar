-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Animated_Gun
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
		SetDropRate(105,1585,100);
	else
		SetDropRate(105,1585,0);
	end
	
	SpawnMob(17330513,120):updateEnmity(target);
	SpawnMob(17330514,120):updateEnmity(target);
	SpawnMob(17330515,120):updateEnmity(target);
	SpawnMob(17330516,120):updateEnmity(target);
	SpawnMob(17330517,120):updateEnmity(target);
	SpawnMob(17330518,120):updateEnmity(target);

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
	
	DespawnMob(17330513);
	DespawnMob(17330514);
	DespawnMob(17330515);
	DespawnMob(17330516);
	DespawnMob(17330517);
	DespawnMob(17330518);
	
end;
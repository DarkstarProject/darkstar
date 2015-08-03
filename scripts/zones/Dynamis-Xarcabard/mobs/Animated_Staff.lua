-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Animated Staff
-----------------------------------

require("scripts/globals/status");
require("scripts/zones/Dynamis-Xarcabard/TextIDs");

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

	if (mob:AnimationSub() == 3) then
		SetDropRate(115,1582,1000);
	else
		SetDropRate(115,1582,0);
	end
	
	target:showText(mob,ANIMATED_STAFF_DIALOG);
	
	SpawnMob(17330337,120):updateEnmity(target);
	SpawnMob(17330338,120):updateEnmity(target);
	SpawnMob(17330339,120):updateEnmity(target);
	SpawnMob(17330347,120):updateEnmity(target);
	SpawnMob(17330348,120):updateEnmity(target);
	SpawnMob(17330349,120):updateEnmity(target);

end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
	-- TODO: add battle dialog
end;

-----------------------------------
-- onMobDisengage
-----------------------------------

function onMobDisengage(mob)
	mob:showText(mob,ANIMATED_STAFF_DIALOG+2);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	killer:showText(mob,ANIMATED_STAFF_DIALOG+1);
	
	DespawnMob(17330337);
	DespawnMob(17330338);
	DespawnMob(17330339);
	DespawnMob(17330347);
	DespawnMob(17330348);
	DespawnMob(17330349);
	
end;
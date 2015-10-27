-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Animated Scythe
-----------------------------------

require("scripts/globals/status");
require("scripts/zones/Dynamis-Xarcabard/TextIDs");

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

	if (mob:AnimationSub() == 3) then
		SetDropRate(112,1577,1000);
	else
		SetDropRate(112,1577,0);
	end
	
	target:showText(mob,ANIMATED_SCYTHE_DIALOG);
	
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
	-- TODO: add battle dialog
end;

-----------------------------------
-- onMobDisengage
-----------------------------------

function onMobDisengage(mob)
	mob:showText(mob,ANIMATED_SCYTHE_DIALOG+2);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	killer:showText(mob,ANIMATED_SCYTHE_DIALOG+1);
	
	DespawnMob(17330420);
	DespawnMob(17330421);
	DespawnMob(17330422);
	DespawnMob(17330432);
	DespawnMob(17330433);
	DespawnMob(17330434);
	
end;
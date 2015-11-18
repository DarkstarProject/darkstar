-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Animated Knuckles
-----------------------------------

require("scripts/globals/status");
require("scripts/zones/Dynamis-Xarcabard/TextIDs");

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

	if (mob:AnimationSub() == 3) then
		SetDropRate(108,1571,1000);
	else
		SetDropRate(108,1571,0);
	end
	
	target:showText(mob,ANIMATED_KNUCKLES_DIALOG);
	
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
	-- TODO: add battle dialog
end;

-----------------------------------
-- onMobDisengage
-----------------------------------

function onMobDisengage(mob)
	mob:showText(mob,ANIMATED_KNUCKLES_DIALOG+2);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	killer:showText(mob,ANIMATED_KNUCKLES_DIALOG+1);
	
	DespawnMob(17330309);
	DespawnMob(17330310);
	DespawnMob(17330311);
	DespawnMob(17330319);
	DespawnMob(17330320);
	DespawnMob(17330321);
	
end;
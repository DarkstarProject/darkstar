-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Animated Great Axe
-----------------------------------

require("scripts/globals/status");
require("scripts/zones/Dynamis-Xarcabard/TextIDs");

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

	if (mob:AnimationSub() == 3) then
		SetDropRate(104,1576,1000);
	else
		SetDropRate(104,1576,0);
	end
	
	target:showText(mob,ANIMATED_GREATAXE_DIALOG);
	
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
	-- TODO: add battle dialog
end;

-----------------------------------
-- onMobDisengage
-----------------------------------

function onMobDisengage(mob)
	mob:showText(mob,ANIMATED_GREATAXE_DIALOG+2);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	killer:showText(mob,ANIMATED_GREATAXE_DIALOG+1);
	
	DespawnMob(17330383);
	DespawnMob(17330384);
	DespawnMob(17330385);
	DespawnMob(17330395);
	DespawnMob(17330396);
	DespawnMob(17330397);
	
end;
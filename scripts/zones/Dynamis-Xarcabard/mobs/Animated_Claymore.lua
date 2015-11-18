-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Animated Claymore
-----------------------------------

require("scripts/globals/status");
require("scripts/zones/Dynamis-Xarcabard/TextIDs");

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

	if (mob:AnimationSub() == 3) then
		SetDropRate(102,1574,1000);
	else
		SetDropRate(102,1574,0);
	end
	
	target:showText(mob,ANIMATED_CLAYMORE_DIALOG);
	
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
	-- TODO: add battle dialog
end;

-----------------------------------
-- onMobDisengage
-----------------------------------

function onMobDisengage(mob)
	mob:showText(mob,ANIMATED_CLAYMORE_DIALOG+2);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	killer:showText(mob,ANIMATED_CLAYMORE_DIALOG+1);
	
	DespawnMob(17330365);
	DespawnMob(17330366);
	DespawnMob(17330367);
	DespawnMob(17330372);
	DespawnMob(17330373);
	DespawnMob(17330374);
	
end;
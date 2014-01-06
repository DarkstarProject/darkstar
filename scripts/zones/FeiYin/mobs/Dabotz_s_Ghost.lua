-----------------------------------
-- Area: FeiYin
-- NM:   Dabotz's Ghost
-----------------------------------

require("scripts/globals/keyitems");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	
	if(killer:hasKeyItem(AQUAFLORA3)) then
		killer:setVar("DabotzKilled",1);
	end
	
end;
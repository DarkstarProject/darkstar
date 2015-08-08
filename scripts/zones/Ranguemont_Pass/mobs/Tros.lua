-----------------------------------
-- Area: Ranguemont Pass
-- NM:   Tros
-- Used in Quests: Painful Memory
-- @pos -289 -45 212 166
-----------------------------------

require("scripts/globals/keyitems");

-----------------------------------
-- OnMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end; 

-----------------------------------
-- OnMobDeath Action
-----------------------------------

function onMobDeath(mob, killer)
	if (killer:hasKeyItem(MERTAIRES_BRACELET)) then 
		killer:setVar("TrosKilled",1);
		killer:setVar("Tros_Timer",os.time());
	end
end;
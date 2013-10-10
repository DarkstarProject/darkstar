-----------------------------------
-- Area: Monastic Cavern
-- NPC:  Orcish Warlord (Overlord Bakgodek PH)
-----------------------------------

require("scripts/zones/Monastic_Cavern/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function OnMobEngaged(mob,target)
-- target:showText(mob,ORCISH_WARLORD_ENGAGE);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
-- killer:showText(mob,ORCISH_WARLORD_DEATH);
		mob:setRespawnTime(math.random((75600),(86400))); -- 21 to 24 hours
end;
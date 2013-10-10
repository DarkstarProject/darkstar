-----------------------------------
-- Area: Qulun_Dome
-- NPC:  Diamond_Quadav (Za Dha Adamantking PH)
-----------------------------------

require("scripts/zones/Qulun_Dome/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function OnMobEngaged(mob,target)
-- target:showText(mob,DIAMOND_QUADAV_ENGAGE);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
-- killer:showText(mob,DIAMOND_QUADAV_DEATH);
	mob:setRespawnTime(math.random((75600),(86400))); -- 21 to 24 hours
end;
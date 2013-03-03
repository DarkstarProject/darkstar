-----------------------------------
-- Area: Monastic Cavern
-- NPC:  Bugaboo
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
   killer:setVar("circleTime",8); -- Set flag so that final CS will show when you interact with alter again
end;
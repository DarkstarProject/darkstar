-----------------------------------
-- Area: Monastic Cavern
--  MOB: Bugaboo
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
   player:setVar("circleTime",8); -- Set flag so that final CS will show when you interact with alter again
end;
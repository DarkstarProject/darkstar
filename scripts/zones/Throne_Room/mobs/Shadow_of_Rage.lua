-----------------------------------
-- Area: Throne Room
-- NPC:  Shadows
-- Mission 9-2 BCNM Fight
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob,target)
end;


-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
end;

function onMobDespawn(mob)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
printf("updateCSID: %u",csid);
printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
printf("finishCSID: %u",csid);
printf("RESULT: %u",option);
end;
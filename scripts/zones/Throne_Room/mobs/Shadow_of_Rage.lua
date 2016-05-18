-----------------------------------
-- Area: Throne Room
--  MOB: Shadows
-- Mission 9-2 BCNM Fight
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

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
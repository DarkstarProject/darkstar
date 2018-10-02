-----------------------------------
-- Area: Temenos N T
--  NPC: Kari

-----------------------------------
require("scripts/globals/limbus");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobDeath(mob, player, isKiller)
    GetNPCByID(16928770+451):setStatus(dsp.status.NORMAL);
end;

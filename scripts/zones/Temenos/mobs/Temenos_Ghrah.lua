-----------------------------------
-- Area: Temenos
--  NPC: Temenos_Ghrah
-----------------------------------
require("scripts/globals/limbus");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobDeath(mob, player, isKiller)
    GetNPCByID(16928770+475):setStatus(dsp.status.NORMAL);
end;

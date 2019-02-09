-----------------------------------
-- Area: Temenos N T
--  NPC: Kari

-----------------------------------
require("scripts/globals/limbus");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    GetNPCByID(16928770+451):setStatus(dsp.status.NORMAL);
end;

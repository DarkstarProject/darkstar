-----------------------------------
-- Area: Temenos N T
--  NPC: Telchines_Dragoon
-----------------------------------
require("scripts/globals/limbus");
-----------------------------------

function onMobEngaged(mob,target)
        GetMobByID(16928791):updateEnmity(target);
end;

function onMobDeath(mob, player, isKiller)
    GetNPCByID(16928770+452):setStatus(dsp.status.NORMAL);
end;

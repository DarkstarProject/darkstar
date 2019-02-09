-----------------------------------
-- Area: Temenos N T
--  NPC: Telchines_Dragoon
-----------------------------------
require("scripts/globals/limbus");
-----------------------------------

function onMobEngaged(mob,target)

end;

function onMobDeath(mob, player, isKiller)
    GetNPCByID(16928770+453):setStatus(dsp.status.NORMAL);
end;

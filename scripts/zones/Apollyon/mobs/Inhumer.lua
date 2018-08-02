-----------------------------------
-- Area: Apollyon SE
--  NPC: Inhumer
-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Apollyon/TextIDs");
require("scripts/zones/Apollyon/MobIDs");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    local mobID = mob:getID();
    if (mobID ==16933025) then -- time
        GetNPCByID(APOLLYON_BASE_CRATE+246):setPos(343,-1,-296);
        GetNPCByID(APOLLYON_BASE_CRATE+246):setStatus(dsp.status.NORMAL);
    elseif (mobID ==16933028) then -- recover
        GetNPCByID(APOLLYON_BASE_CRATE+248):setPos(376,-1,-259);
        GetNPCByID(APOLLYON_BASE_CRATE+248):setStatus(dsp.status.NORMAL);
    elseif (mobID ==16933022) then -- item
        GetNPCByID(APOLLYON_BASE_CRATE+247):setPos(307,-1,-309);
        GetNPCByID(APOLLYON_BASE_CRATE+247):setStatus(dsp.status.NORMAL);
    end
end;
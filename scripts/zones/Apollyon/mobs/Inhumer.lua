-----------------------------------
-- Area: Apollyon SE
--  NPC: Inhumer

-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Apollyon/TextIDs");
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
    GetNPCByID(16932864+246):setPos(343,-1,-296);
    GetNPCByID(16932864+246):setStatus(STATUS_NORMAL);
 elseif (mobID ==16933028) then -- recover
    GetNPCByID(16932864+248):setPos(376,-1,-259);
    GetNPCByID(16932864+248):setStatus(STATUS_NORMAL);
 elseif (mobID ==16933022) then -- item
    GetNPCByID(16932864+247):setPos(307,-1,-309);
    GetNPCByID(16932864+247):setStatus(STATUS_NORMAL);
 end

end;
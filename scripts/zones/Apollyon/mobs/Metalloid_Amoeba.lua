-----------------------------------
-- Area: Apollyon SE
--  NPC: Metalloid_Amoeba
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
    -- print(mobID);
    local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();
 
    if (mobID ==16932997) then -- time
        GetNPCByID(APOLLYON_BASE_CRATE+1):setPos(mobX,mobY,mobZ);
        GetNPCByID(APOLLYON_BASE_CRATE+1):setStatus(dsp.status.NORMAL);
    elseif (mobID ==16932994) then -- recover
        GetNPCByID(APOLLYON_BASE_CRATE+3):setPos(mobX,mobY,mobZ);
        GetNPCByID(APOLLYON_BASE_CRATE+3):setStatus(dsp.status.NORMAL);
    elseif (mobID ==16932996) then -- item
        GetNPCByID(APOLLYON_BASE_CRATE+2):setPos(mobX,mobY,mobZ);
        GetNPCByID(APOLLYON_BASE_CRATE+2):setStatus(dsp.status.NORMAL);
    end
end;
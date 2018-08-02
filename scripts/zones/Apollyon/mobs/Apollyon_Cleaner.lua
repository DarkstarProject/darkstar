-----------------------------------
-- Area: Apollyon NE
--  NPC: Apollyon Cleaner
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

    if (mobID ==16933082) then -- item
        GetNPCByID(APOLLYON_BASE_CRATE+140):setPos(mobX,mobY,mobZ);
        GetNPCByID(APOLLYON_BASE_CRATE+140):setStatus(dsp.status.NORMAL);
    end
end;
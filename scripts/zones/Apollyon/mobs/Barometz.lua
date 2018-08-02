-----------------------------------
-- Area: Apollyon NE
--  NPC: Barometz
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

    if (mobID ==16933045 and GetMobByID(16933044):isDead()) then -- item
        GetNPCByID(APOLLYON_BASE_CRATE+119):setPos(mobX,mobY,mobZ);
        GetNPCByID(APOLLYON_BASE_CRATE+119):setStatus(dsp.status.NORMAL);
    end
end;
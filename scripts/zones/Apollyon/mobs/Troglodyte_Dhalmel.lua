-----------------------------------
-- Area: Apollyon NE
-- NPC:  Troglodyte Dhalmel
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
 
    if (GetMobByID(16933115):isDead() and GetMobByID(16933116):isDead() and GetMobByID(16933117):isDead() and
        GetMobByID(16933118):isDead() and GetMobByID(16933119):isDead() and GetMobByID(16933120):isDead() and
        GetMobByID(16933121):isDead() and GetMobByID(16933122):isDead()) then
        GetNPCByID(APOLLYON_BASE_CRATE+178):setPos(mobX,mobY,mobZ);
        GetNPCByID(APOLLYON_BASE_CRATE+178):setStatus(dsp.status.NORMAL);
    end
end;
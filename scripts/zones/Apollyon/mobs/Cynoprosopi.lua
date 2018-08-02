-----------------------------------
-- Area: Apollyon NW
--  NPC: Cynoprosopi
-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Apollyon/TextIDs");
require("scripts/zones/Apollyon/MobIDs");
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(dsp.mod.DMGPHYS, -200);
    mob:addMod(dsp.mod.MDEF, 500);
end;

function onMobEngaged(mob,target)
    if (GetMobByID(16932977):isDead() and GetMobByID(16932978):isDead() and GetMobByID(16932979):isDead() and
        GetMobByID(16932980):isDead() and GetMobByID(16932981):isDead()) then
        mob:delMod(dsp.mod.DMGPHYS, -200);
        mob:delMod(dsp.mod.MDEF, 500);
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();
    GetNPCByID(APOLLYON_BASE_CRATE+110):setPos(mobX,mobY,mobZ);
    GetNPCByID(APOLLYON_BASE_CRATE+110):setStatus(dsp.status.NORMAL);
end;
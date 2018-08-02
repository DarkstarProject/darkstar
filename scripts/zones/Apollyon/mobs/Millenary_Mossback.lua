-----------------------------------
-- Area: Apollyon NW
--  NPC: Millenary Mossback
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
    if (GetMobByID(16932964):isDead() and GetMobByID(16932965):isDead() and GetMobByID(16932966):isDead() and GetMobByID(16932967):isDead() and
        GetMobByID(16932968):isDead() and GetMobByID(16932969):isDead() and GetMobByID(16932970):isDead()) then
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
    GetNPCByID(APOLLYON_BASE_CRATE+109):setPos(mobX,mobY,mobZ);
    GetNPCByID(APOLLYON_BASE_CRATE+109):setStatus(dsp.status.NORMAL);
end;
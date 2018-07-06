-----------------------------------
-- Area: Apollyon NW
--  NPC: Pluto
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
    if (GetMobByID(16932938):isDead() and GetMobByID(16932939):isDead() and GetMobByID(16932940):isDead() and 
        GetMobByID(16932941):isDead() and GetMobByID(16932942):isDead() and GetMobByID(16932943):isDead() and 
        GetMobByID(16932944):isDead()) then
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
    GetNPCByID(APOLLYON_BASE_CRATE+107):setPos(mobX,mobY,mobZ);
    GetNPCByID(APOLLYON_BASE_CRATE+107):setStatus(dsp.status.NORMAL);
end;
-----------------------------------
-- Area: Apollyon NW
--  NPC: Zlatorog
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
    if (GetMobByID(16932951):isDead() and GetMobByID(16932952):isDead() and GetMobByID(16932953):isDead() and GetMobByID(16932954):isDead() and
        GetMobByID(16932955):isDead() and GetMobByID(16932956):isDead() and GetMobByID(16932957):isDead()) then
        mob:delMod(dsp.mod.DMGPHYS, -200);
        mob:delMod(dsp.mod.MDEF, 500);
    end
end;

function onMobDespawn(mob)
    local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();
    GetNPCByID(APOLLYON_BASE_CRATE+108):setPos(mobX,mobY,mobZ);
    GetNPCByID(APOLLYON_BASE_CRATE+108):setStatus(dsp.status.NORMAL);
end;

-- mighty strikes multiple times
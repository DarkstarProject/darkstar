-----------------------------------
-- Area: Apollyon SE
--  NPC: Evil_Armory
-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Apollyon/TextIDs");
require("scripts/zones/Apollyon/MobIDs");
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(dsp.mod.DMGPHYS, -200);
    mob:addMod(dsp.mod.MDEF, 500);
end;

function onMobEngaged(mob,target)
    if (GetMobByID(16933033):isDead() and GetMobByID(16933034):isDead() and GetMobByID(16933035):isDead() and GetMobByID(16933036):isDead() and
        GetMobByID(16933037):isDead() and GetMobByID(16933038):isDead() and GetMobByID(16933039):isDead() and GetMobByID(16933040):isDead()) then
        mob:delMod(dsp.mod.DMGPHYS, -200);
        mob:delMod(dsp.mod.MDEF, 500);
    end
    GetMobByID(16933033):updateEnmity(target);
    GetMobByID(16933034):updateEnmity(target);
    GetMobByID(16933035):updateEnmity(target);
    GetMobByID(16933036):updateEnmity(target);
    GetMobByID(16933037):updateEnmity(target);
    GetMobByID(16933038):updateEnmity(target);
    GetMobByID(16933039):updateEnmity(target);
    GetMobByID(16933040):updateEnmity(target);
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    local mobID = mob:getID();
    -- print(mobID);
    local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();

    GetNPCByID(APOLLYON_BASE_CRATE+263):setPos(mobX,mobY,mobZ);
    GetNPCByID(APOLLYON_BASE_CRATE+263):setStatus(dsp.status.NORMAL);
end;
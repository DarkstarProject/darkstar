-----------------------------------
-- Area: Apollyon SW
-- NPC:  Jidra
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
    local mobID = mob:getID();    
    -- print(mobID);
    if (mobID ==16932882) then
        SpawnMob(16932889):updateEnmity(player);
    elseif (mobID ==16932883) then    
        SpawnMob(16932890):updateEnmity(player);
    elseif (mobID ==16932884) then
        SpawnMob(16932891):updateEnmity(player);
    elseif (mobID ==16932885) then
        SpawnMob(16932892):updateEnmity(player);
    elseif (mobID ==16932886) then    
        SpawnMob(16932893):updateEnmity(player);
    elseif (mobID ==16932887) then
        SpawnMob(16932894):updateEnmity(player);
    elseif (mobID ==16932888) then
        SpawnMob(16932895):updateEnmity(player);
    end
end;

function onMobDespawn(mob)
    local mobID = mob:getID();    
    -- print(mobID);
    local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();

    if (GetMobByID(16932882):isDead() and GetMobByID(16932883):isDead() and GetMobByID(16932884):isDead() and GetMobByID(16932885):isDead() and
        GetMobByID(16932886):isDead() and GetMobByID(16932887):isDead() and GetMobByID(16932888):isDead())then
        GetNPCByID(APOLLYON_BASE_CRATE+70):setPos(mobX+3,mobY,mobZ); -- time
        GetNPCByID(APOLLYON_BASE_CRATE+70):setStatus(dsp.status.NORMAL);
        GetNPCByID(APOLLYON_BASE_CRATE+71):setPos(mobX+4,mobY,mobZ+4); -- recover
        GetNPCByID(APOLLYON_BASE_CRATE+71):setStatus(dsp.status.NORMAL);
        GetNPCByID(APOLLYON_BASE_CRATE+72):setPos(mobX,mobY,mobZ-3); -- item
        GetNPCByID(APOLLYON_BASE_CRATE+72):setStatus(dsp.status.NORMAL);
    end
end;
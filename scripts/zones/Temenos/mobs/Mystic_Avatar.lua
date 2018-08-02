-----------------------------------
-- Area: Temenos E T
-- NPC: Mystic Avatar
-----------------------------------
package.loaded["scripts/zones/Temenos/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Temenos/TextIDs");
require("scripts/zones/Temenos/MobIDs");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
    local mobID = mob:getID();
    if (mobID==16929030) then --Carbuncle (Central Temenos 2nd Floor)
        GetMobByID(16929032):updateEnmity(target);
        GetMobByID(16929031):updateEnmity(target);
        if (GetMobByID(16929033):isDead() and GetMobByID(16929039):isDead()) then
            mob:setMod(dsp.mod.FIREDEF,-128);
        else
            mob:setMod(dsp.mod.FIREDEF,256);
        end
    
        if (GetMobByID(16929034):isDead() and GetMobByID(16929040):isDead()) then
            mob:setMod(dsp.mod.ICEDEF,-128);
        else
            mob:setMod(dsp.mod.ICEDEF,256);
        end

        if (GetMobByID(16929035):isDead() and GetMobByID(16929041):isDead()) then
            mob:setMod(dsp.mod.WINDDEF,-128);
        else
            mob:setMod(dsp.mod.WINDDEF,256);
        end

        if (GetMobByID(16929036):isDead() and GetMobByID(16929042):isDead()) then
            mob:setMod(dsp.mod.EARTHDEF,-128);
        else
            mob:setMod(dsp.mod.EARTHDEF,256);
        end

        if (GetMobByID(16929037):isDead() and GetMobByID(16929043):isDead()) then
            mob:setMod(dsp.mod.THUNDERDEF,-128);
        else
            mob:setMod(dsp.mod.THUNDERDEF,256);
        end

        if (GetMobByID(16929038):isDead() and GetMobByID(16929044):isDead()) then
            mob:setMod(dsp.mod.WATERDEF,-128);
        else
            mob:setMod(dsp.mod.WATERDEF,256);
        end

        mob:setMod(dsp.mod.LIGHTDEF,256);
        mob:setMod(dsp.mod.DARKDEF,-128);
    end
end;

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID();
    local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();

    if (mobID==16928844) then --Ifrit
        GetNPCByID(TEMENOS_BASE_CRATE+40):setPos(mobX,mobY,mobZ);
        GetNPCByID(TEMENOS_BASE_CRATE+40):setStatus(dsp.status.NORMAL);
    elseif (mobID==16928853) then --Shiva
        GetNPCByID(TEMENOS_BASE_CRATE+45):setPos(mobX,mobY,mobZ);
        GetNPCByID(TEMENOS_BASE_CRATE+45):setStatus(dsp.status.NORMAL);
    elseif (mobID==16928862) then --Garuda
        GetNPCByID(TEMENOS_BASE_CRATE+46):setPos(mobX,mobY,mobZ);
        GetNPCByID(TEMENOS_BASE_CRATE+46):setStatus(dsp.status.NORMAL);
    elseif (mobID==16928871) then --Titan
        GetNPCByID(TEMENOS_BASE_CRATE+47):setPos(mobX,mobY,mobZ);
        GetNPCByID(TEMENOS_BASE_CRATE+47):setStatus(dsp.status.NORMAL);
    elseif (mobID==16928880) then --Ramuh
        GetNPCByID(TEMENOS_BASE_CRATE+68):setPos(mobX,mobY,mobZ);
        GetNPCByID(TEMENOS_BASE_CRATE+68):setStatus(dsp.status.NORMAL);
    elseif (mobID==16928889) then --Leviathan
        GetNPCByID(TEMENOS_BASE_CRATE+69):setPos(mobX,mobY,mobZ);
        GetNPCByID(TEMENOS_BASE_CRATE+69):setStatus(dsp.status.NORMAL);
    elseif (mobID==16928894) then --Fenrir
        GetNPCByID(TEMENOS_BASE_CRATE+70):setPos(mobX,mobY,mobZ);
        GetNPCByID(TEMENOS_BASE_CRATE+70):setStatus(dsp.status.NORMAL);
    elseif (mobID==16929030) then --Carbuncle (Central Temenos 2nd Floor)
        if (GetMobByID(16929031):isDead() and GetMobByID(16929032):isDead()) then
            GetNPCByID(TEMENOS_BASE_CRATE+77):setPos(0.5,-6,-459);
            GetNPCByID(TEMENOS_BASE_CRATE+77):setStatus(dsp.status.NORMAL);
            GetNPCByID(16928770+473):setStatus(dsp.status.NORMAL);
        end
    end
end;

-----------------------------------
-- Area:
--  MOB:
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
-----------------------------------
function onMobSpawn(mob)   
end;

function onMobFight(mob, target)
    local instance = mob:getInstance();
    if (instance:getStage() == 4 and instance:getProgress() == 2) then
        if ID.mob[4][2].mobs_end == mob:getID() then
            local popTime = mob:getLocalVar("lastPetPop");
            if (os.time() - popTime > 45) then
                local Rose = instance:getEntity(bit.band(ID.mob[4][2].Rose, 0xFFF), dsp.objType.MOB)
                if (not Rose:isSpawned()) then
                    SpawnMob(ID.mob[4][2].Rose, instance):updateEnmity(target);
                    mob:setLocalVar("lastPetPop", os.time());
                end
            end
        end
    elseif (instance:getStage() == 5 and instance:getProgress() == 1) then
        if ID.mob[5][1].rampart1 == mob:getID() then
            local popTime = mob:getLocalVar("lastPetPop");
            if (os.time() - popTime > 45) then
                local manta = instance:getEntity(bit.band(ID.mob[5][1].manta, 0xFFF), dsp.objType.MOB)
                local offset = math.random(0,1)
                if (not manta:isSpawned()) then
                    SpawnMob((ID.mob[5][1].manta)+offset, instance):updateEnmity(target);
                    mob:setLocalVar("lastPetPop", os.time());
                end
            end
        elseif ID.mob[5][1][3].mobs_end == mob:getID() then
            local popTime = mob:getLocalVar("lastPetPop");
            if (os.time() - popTime > 45) then
                local manta = instance:getEntity(bit.band(ID.mob[5][1].manta2, 0xFFF), dsp.objType.MOB)
                local offset = math.random(0,1)
                if (not manta:isSpawned()) then
                    SpawnMob((ID.mob[5][1].manta2)+offset, instance):updateEnmity(target);
                    mob:setLocalVar("lastPetPop", os.time());
                end
            end
        elseif ID.mob[5][1].rampart2 == mob:getID() then
            local popTime = mob:getLocalVar("lastPetPop");
            if (os.time() - popTime > 45) then
                local pugil = instance:getEntity(bit.band(ID.mob[5][1].pugil, 0xFFF), dsp.objType.MOB)
                local offset = math.random(0,2)
                if (not pugil:isSpawned()) then
                    SpawnMob((ID.mob[5][1].pugil)+offset, instance):updateEnmity(target);
                    mob:setLocalVar("lastPetPop", os.time());
                end
            end
        end
    elseif (instance:getStage() == 5 and instance:getProgress() == 2) then
        if ID.mob[5][2].mobs_end == mob:getID() then
            local popTime = mob:getLocalVar("lastPetPop");
            if (os.time() - popTime > 45) then
                local goobbue = instance:getEntity(bit.band(ID.mob[5][2].goobbue, 0xFFF), dsp.objType.MOB)
                if (not goobbue:isSpawned()) then
                    SpawnMob((ID.mob[5][2].goobbue), instance):updateEnmity(target);
                    mob:setLocalVar("lastPetPop", os.time());
                end
            end
        elseif ID.mob[5][2].rampart1 == mob:getID() then
            local popTime = mob:getLocalVar("lastPetPop");
            if (os.time() - popTime > 45) then
                local mandy = instance:getEntity(bit.band(ID.mob[5][2].mandy, 0xFFF), dsp.objType.MOB)
                local offset = math.random(0,2)
                if (not mandy:isSpawned()) then
                    SpawnMob((ID.mob[5][2].mandy)+offset, instance):updateEnmity(target);
                    mob:setLocalVar("lastPetPop", os.time());
                end
            end
        elseif ID.mob[5][2].rampart2 == mob:getID() then
            local popTime = mob:getLocalVar("lastPetPop");
            if (os.time() - popTime > 45) then
                local goobbue = instance:getEntity(bit.band(ID.mob[5][2].goobbue2, 0xFFF), dsp.objType.MOB)
                local offset = math.random(0,1)
                if (not goobbue:isSpawned()) then
                    SpawnMob((ID.mob[5][2].goobbue)+offset, instance):updateEnmity(target);
                    mob:setLocalVar("lastPetPop", os.time());
                end
            end
        end
    elseif (instance:getStage() == 6 and instance:getProgress() >= 1) then
        if ID.mob[6].rampart1 == mob:getID() then
            local popTime = mob:getLocalVar("lastPetPop");
            if (os.time() - popTime > 45) then
                local treant = instance:getEntity(bit.band(ID.mob[6].treant, 0xFFF), dsp.objType.MOB)
                local offset = math.random(0,1)
                if (not treant:isSpawned()) then
                    SpawnMob((ID.mob[6].treant)+offset, instance):updateEnmity(target);
                    mob:setLocalVar("lastPetPop", os.time());
                end
            end
        elseif ID.mob[6].rampart2 == mob:getID() then
            local popTime = mob:getLocalVar("lastPetPop");
            if (os.time() - popTime > 45) then
                local treant = instance:getEntity(bit.band(ID.mob[6].treant2, 0xFFF), dsp.objType.MOB)
                local offset = math.random(0,1)
                if (not treant:isSpawned()) then
                    SpawnMob((ID.mob[6].treant2)+offset, instance):updateEnmity(target);
                    mob:setLocalVar("lastPetPop", os.time());
                end
            end
        end
    elseif (instance:getStage() == 7 and instance:getProgress() == 0) then
        if ID.mob[6].rampart3 == mob:getID() then
            local popTime = mob:getLocalVar("lastPetPop");
            if (os.time() - popTime > 45) then
                local sapling = instance:getEntity(bit.band(ID.mob[6].sapling, 0xFFF), dsp.objType.MOB)
                local offset = math.random(0,2)
                if (not sapling:isSpawned()) then
                    SpawnMob((ID.mob[6].sapling)+offset, instance):updateEnmity(target);
                    mob:setLocalVar("lastPetPop", os.time());
                end
            end
        elseif ID.mob[6].rampart4 == mob:getID() then
            local popTime = mob:getLocalVar("lastPetPop");
            if (os.time() - popTime > 45) then
                local korrigan = instance:getEntity(bit.band(ID.mob[6].korrigan, 0xFFF), dsp.objType.MOB)
                local offset = math.random(0,2)
                if (not korrigan:isSpawned()) then
                    SpawnMob((ID.mob[6].korrigan)+offset, instance):updateEnmity(target);
                    mob:setLocalVar("lastPetPop", os.time());
                end
            end
        end
    end
end;

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance();
    if (ID.mob[6].rampart1 == mob:getID() or ID.mob[6].rampart2 == mob:getID()) then
        if instance:getStage() == 6 and instance:getProgress() >= 1 then
            if (isKiller) then
                instance:setProgress(instance:getProgress() + 1)
            end
        end
    end
end;

function onMobDespawn(mob)
end;
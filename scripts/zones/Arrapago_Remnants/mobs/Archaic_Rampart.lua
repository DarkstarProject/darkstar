-----------------------------------
-- Area: Archaic Rampart
--  MOB: Arrapago Remnants
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
mixins = {require("scripts/mixins/families/rampart")}
-----------------------------------
function onMobSpawn(mob)
    local instance = mob:getInstance()
    mob:setLocalVar("swapTime", os.time())
end

function onMobFight(mob,target)
    local instance = mob:getInstance()
    local popTime = mob:getLocalVar("lastPetPop")
    local POS = mob:getPos()
    local PET1 = instance:getEntity(bit.band((mob:getID() +1), 0xFFF), dsp.objType.MOB)
    local PET2 = instance:getEntity(bit.band((mob:getID() +2), 0xFFF), dsp.objType.MOB)
    local PET3 = instance:getEntity(bit.band((mob:getID() +3), 0xFFF), dsp.objType.MOB)

    if mob:getID() == 17080489 or  mob:getID() == 17080512 or mob:getID() == 17080553 then
        if os.time() - popTime > 15 then
            if (not PET1:isSpawned()) then
                PET1:setSpawn(POS.x, POS.y, POS.z, POS.rot)
                mob:useMobAbility(2034)
                mob:setLocalVar("lastPetPop", os.time())
                mob:timer(2500, function(mob)
                SpawnMob((mob:getID() +1), instance)
                end)
            end
        end
        if PET1:isSpawned() then
            PET1:updateEnmity(target)
        end
    elseif mob:getID() == 17080492 or  mob:getID() == 17080509 or mob:getID() == 17080523 or mob:getID() == 17080530 or  mob:getID() == 17080555 or mob:getID() == 17080559 or mob:getID() == 17080570 then
        if os.time() - popTime > 15 then
            if (not PET1:isSpawned()) then
                PET1:setSpawn(POS.x, POS.y, POS.z, POS.rot)
                mob:useMobAbility(2034)
                mob:setLocalVar("lastPetPop", os.time())
                mob:timer(2500, function(mob)
                SpawnMob((mob:getID() +1), instance)
                end)
            elseif (not PET2:isSpawned()) then
                PET2:setSpawn(POS.x, POS.y, POS.z, POS.rot)
                mob:useMobAbility(2034)
                mob:setLocalVar("lastPetPop", os.time())
                mob:timer(2500, function(mob)
                SpawnMob((mob:getID() +2), instance)
                end)
            end
        end
        if PET1:isSpawned() then
            PET1:updateEnmity(target)
        end
        if PET2: isSpawned() then
            PET1:updateEnmity(target)
        end
    elseif mob:getID() == 17080533 or  mob:getID() == 17080545 or mob:getID() == 17080577 or mob:getID() == 17080581 then
        if os.time() - popTime > 15 then
            if (not PET1:isSpawned()) then
                PET1:setSpawn(POS.x, POS.y, POS.z, POS.rot)
                mob:useMobAbility(2034)
                mob:setLocalVar("lastPetPop", os.time())
                mob:timer(2500, function(mob)
                SpawnMob((mob:getID() +1), instance)
                end)
            elseif (not PET2:isSpawned()) then
                PET2:setSpawn(POS.x, POS.y, POS.z, POS.rot)
                mob:useMobAbility(2034)
                mob:setLocalVar("lastPetPop", os.time())
                mob:timer(2500, function(mob)
                SpawnMob((mob:getID() +2), instance)
                end)
            elseif (not PET3:isSpawned()) then
                PET3:setSpawn(POS.x, POS.y, POS.z, POS.rot)
                mob:useMobAbility(2034)
                mob:setLocalVar("lastPetPop", os.time())
                mob:timer(2500, function(mob)
                SpawnMob((mob:getID() +3), instance)
                end)
            end
        end
        if PET1:isSpawned() then
            PET1:updateEnmity(target)
        end
        if PET2: isSpawned() then
            PET2:updateEnmity(target)
        end
        if PET3: isSpawned() then
            PET3:updateEnmity(target)
        end
    end
end

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance()
    if (ID.mob[6].rampart1 == mob:getID() or ID.mob[6].rampart2 == mob:getID()) then
        if instance:getStage() == 6 and instance:getProgress() >= 1 then
            if (isKiller) then
                instance:setProgress(instance:getProgress() + 1)
            end
        end
    end
end

function onMobDespawn(mob)
end
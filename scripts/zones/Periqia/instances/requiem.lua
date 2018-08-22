-----------------------------------
--
-- Assault: Requiem
--
-----------------------------------
require("scripts/globals/instance")
require("scripts/zones/Periqia/IDs")
-----------------------------------
-- Todo random the chest locations

function afterInstanceRegister(player)
    local instance = player:getInstance()
    
    player:messageSpecial(Periqia.text.ASSAULT_32_START, 32)
    player:messageSpecial(Periqia.text.TIME_TO_COMPLETE, instance:getTimeLimit())
end

function onInstanceCreated(instance)
    for i,v in pairs(Periqia.mobs[32]) do
        SpawnMob(v, instance)
    end

    instance:getEntity(bit.band(Periqia.npcs.RUNE_OF_RELEASE, 0xFFF), dsp.objType.NPC):setPos(-489.346,-9.78,-326.579,90)
    instance:getEntity(bit.band(Periqia.npcs.ANCIENT_LOCKBOX, 0xFFF), dsp.objType.NPC):setPos(-491.96,-9.668,-322.733,90)
end

function onInstanceTimeUpdate(instance, elapsed)
    updateInstanceTime(instance, elapsed, Periqia.text)
end

function onInstanceFailure(instance)
    local chars = instance:getChars()

    for i,v in pairs(chars) do
        v:messageSpecial(Periqia.text.MISSION_FAILED,10,10)
        v:startEvent(102)
    end
end

function onInstanceProgressUpdate(instance, progress)
    if (progress >= 18) then
        instance:complete();
    end
end

function onInstanceComplete(instance)
    local chars = instance:getChars()

    for i,v in pairs(chars) do
        v:messageSpecial(Periqia.text.RUNE_UNLOCKED_POS, 5, 9)
    end

    instance:getEntity(bit.band(Periqia.npcs.RUNE_OF_RELEASE, 0xFFF), dsp.objType.NPC):setStatus(NORMAL)
    instance:getEntity(bit.band(Periqia.npcs.ANCIENT_LOCKBOX, 0xFFF), dsp.objType.NPC):setStatus(NORMAL)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
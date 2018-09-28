-----------------------------------
--
-- Assault: Golden Salvage
--
-----------------------------------
require("scripts/globals/instance")
require("scripts/zones/Ilrusi_Atoll/IDs")
-----------------------------------
-- Todo random the chest locations

function afterInstanceRegister(player)
    local instance = player:getInstance()
    
    player:messageSpecial(Ilrusi.text.ASSAULT_41_START, 41)
    player:messageSpecial(Ilrusi.text.TIME_TO_COMPLETE, instance:getTimeLimit())
end

function onInstanceCreated(instance)
    local figureheadChest = math.random(Ilrusi.npcs.ILRUSI_CURSED_CHEST_OFFSET, Ilrusi.npcs.ILRUSI_CURSED_CHEST_OFFSET + 11)

    for i,v in pairs(Ilrusi.mobs[1]) do
        SpawnMob(v, instance)
    end

    instance:getEntity(bit.band(Ilrusi.npcs.RUNE_OF_RELEASE, 0xFFF), dsp.objType.NPC):setPos(420,-15,72,148)
    instance:getEntity(bit.band(Ilrusi.npcs.ANCIENT_LOCKBOX, 0xFFF), dsp.objType.NPC):setPos(415,-15,75,148)
    instance:getEntity(bit.band(Ilrusi.npcs._1jp, 0xFFF), dsp.objType.NPC):setAnimation(8)
    instance:getEntity(bit.band(Ilrusi.npcs._jja, 0xFFF), dsp.objType.NPC):setAnimation(8)
    instance:getEntity(bit.band(Ilrusi.npcs._jjb, 0xFFF), dsp.objType.NPC):setAnimation(8)

    instance:setProgress(instance:getProgress() + (figureheadChest))

end

function onInstanceTimeUpdate(instance, elapsed)
    updateInstanceTime(instance, elapsed, Ilrusi.text)
end

function onInstanceFailure(instance)

    local chars = instance:getChars()

    for i,v in pairs(chars) do
        v:messageSpecial(Ilrusi.text.MISSION_FAILED,10,10)
        v:startEvent(102)
    end
end

function onInstanceProgressUpdate(instance, progress)
end

function onInstanceComplete(instance)

    local chars = instance:getChars()

    for i,v in pairs(chars) do
        v:messageSpecial(Ilrusi.text.RUNE_UNLOCKED_POS, 8, 8)
    end

    instance:getEntity(bit.band(Ilrusi.npcs.RUNE_OF_RELEASE, 0xFFF), dsp.objType.NPC):setStatus(NORMAL)
    instance:getEntity(bit.band(Ilrusi.npcs.ANCIENT_LOCKBOX, 0xFFF), dsp.objType.NPC):setStatus(NORMAL)

end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
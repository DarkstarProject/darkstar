-----------------------------------
--
-- Assault: Preemptive Strike
--
-----------------------------------
require("scripts/globals/instance")
require("scripts/zones/Mamool_Ja_Training_Grounds/IDs");
-----------------------------------

function afterInstanceRegister(player)
    local instance = player:getInstance();
    player:messageSpecial(Mamool.text.ASSAULT_12_START, 12);
    player:messageSpecial(Mamool.text.TIME_TO_COMPLETE, instance:getTimeLimit());
end;

function onInstanceCreated(instance)

    for i,v in pairs(Mamool.mobs[1]) do
        SpawnMob(v, instance);
    end

    local rune = instance:getEntity(bit.band(Mamool.npcs.RUNE_OF_RELEASE, 0xFFF), dsp.objType.NPC);
    local box = instance:getEntity(bit.band(Mamool.npcs.ANCIENT_LOCKBOX, 0xFFF), dsp.objType.NPC);
    rune:setPos(-57, 1, -101,49);
    box:setPos(-57, 1, -104,49);

end;

function onInstanceTimeUpdate(instance, elapsed)
    updateInstanceTime(instance, elapsed, Leujaoam.text)
end;

function onInstanceFailure(instance)

    local chars = instance:getChars();

    for i,v in pairs(chars) do
        v:messageSpecial(Mamool.text.MISSION_FAILED,10,10);
--        v:startEvent(102);
    end
end;

function onInstanceProgressUpdate(instance, progress)

    if (progress >= 20) then
        instance:complete();
    end

end;

function onInstanceComplete(instance)

    local chars = instance:getChars();

    for i,v in pairs(chars) do
        v:messageSpecial(Mamool.text.RUNE_UNLOCKED_POS, 8, 8);
    end

    local rune = instance:getEntity(bit.band(Mamool.npcs.RUNE_OF_RELEASE, 0xFFF), dsp.objType.NPC);
    local box = instance:getEntity(bit.band(Mamool.npcs.ANCIENT_LOCKBOX, 0xFFF), dsp.objType.NPC);
    rune:setStatus(dsp.status.NORMAL);
    box:setStatus(dsp.status.NORMAL);

end;

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
-----------------------------------
--
-- Assault: Troll Fugitives
--
-----------------------------------
require("scripts/globals/instance")
require("scripts/zones/Lebros_Cavern/IDs");
-----------------------------------

function afterInstanceRegister(player)
    local instance = player:getInstance();
    player:messageSpecial(Lebros.text.ASSAULT_23_START, 23);
    player:messageSpecial(Lebros.text.TIME_TO_COMPLETE, instance:getTimeLimit());
end;

function onInstanceCreated(instance)

    for i,v in pairs(Lebros.mobs[23]) do
        SpawnMob(v, instance);
    end

    local rune = instance:getEntity(bit.band(Lebros.npcs.RUNE_OF_RELEASE, 0xFFF), dsp.objType.NPC);
    local box = instance:getEntity(bit.band(Lebros.npcs.ANCIENT_LOCKBOX, 0xFFF), dsp.objType.NPC);
    rune:setPos(-376.272,-9.893,89.189,0);
    box:setPos(-384.097,-10,84.954,49);

end;

function onInstanceTimeUpdate(instance, elapsed)
    updateInstanceTime(instance, elapsed, Lebros.text)
end;

function onInstanceFailure(instance)

    local chars = instance:getChars();

    for i,v in pairs(chars) do
        v:messageSpecial(Lebros.text.MISSION_FAILED,10,10);
        v:startEvent(102);
    end
end;

function onInstanceProgressUpdate(instance, progress)

    if (progress >= 15) then
        instance:complete();
    end

end;

function onInstanceComplete(instance)

    local chars = instance:getChars();

    for i,v in pairs(chars) do
        v:messageSpecial(Lebros.text.RUNE_UNLOCKED, 8, 8);
    end

    local rune = instance:getEntity(bit.band(Lebros.npcs.RUNE_OF_RELEASE, 0xFFF), dsp.objType.NPC);
    local box = instance:getEntity(bit.band(Lebros.npcs.ANCIENT_LOCKBOX, 0xFFF), dsp.objType.NPC);
    rune:setStatus(dsp.status.NORMAL);
    box:setStatus(dsp.status.NORMAL);

end;

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
-----------------------------------
-- 
-- Assault: Leujaoam Cleansing
-- 
-----------------------------------

require("scripts/globals/instance")
local Leujaoam = require("scripts/zones/Leujaoam_Sanctum/IDs");

-----------------------------------
-- afterInstanceRegister
-----------------------------------

function afterInstanceRegister(player)
    local instance = player:getInstance();
    player:messageSpecial(Leujaoam.text.ASSAULT_01_START, 1);
    player:messageSpecial(Leujaoam.text.TIME_TO_COMPLETE, instance:getTimeLimit());
end;    

-----------------------------------
-- onInstanceCreated
-----------------------------------

function onInstanceCreated(instance)

    for i,v in pairs(Leujaoam.mobs[1]) do
        SpawnMob(v, instance);
    end

    local rune = instance:getEntity(bit.band(Leujaoam.npcs.RUNE_OF_RELEASE, 0xFFF), TYPE_NPC);
    local box = instance:getEntity(bit.band(Leujaoam.npcs.ANCIENT_LOCKBOX, 0xFFF), TYPE_NPC);
    rune:setPos(476,8.479,39,49);
    box:setPos(476,8.479,40,49);
    
    instance:getEntity(bit.band(Leujaoam.npcs._1XN, 0xFFF), TYPE_NPC):setAnimation(8);
    
end;

-----------------------------------
-- onInstanceTimeUpdate
-----------------------------------

function onInstanceTimeUpdate(instance, elapsed)
    updateInstanceTime(instance, elapsed, Leujaoam.text)
end;

-----------------------------------
-- onInstanceFailure
-----------------------------------

function onInstanceFailure(instance)

    local chars = instance:getChars();

    for i,v in pairs(chars) do
        v:messageSpecial(Leujaoam.text.MISSION_FAILED,10,10);
        v:startEvent(0x66);
    end
end;

-----------------------------------
-- onInstanceProgressUpdate
-----------------------------------

function onInstanceProgressUpdate(instance, progress)

    if (progress >= 15) then
        instance:complete();
    end
    
end;

-----------------------------------
-- onInstanceComplete
-----------------------------------

function onInstanceComplete(instance)

    local chars = instance:getChars();

    for i,v in pairs(chars) do
        v:messageSpecial(Leujaoam.text.RUNE_UNLOCKED_POS, 8, 8);
    end
    
    local rune = instance:getEntity(bit.band(Leujaoam.npcs.RUNE_OF_RELEASE, 0xFFF), TYPE_NPC);
    local box = instance:getEntity(bit.band(Leujaoam.npcs.ANCIENT_LOCKBOX, 0xFFF), TYPE_NPC);
    rune:setStatus(STATUS_NORMAL);
    box:setStatus(STATUS_NORMAL);
    
end;

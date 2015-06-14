-----------------------------------
-- 
-- Assault: Leujaoam Cleansing
-- 
-----------------------------------

require("scripts/zones/Leujaoam_Sanctum/IDs");

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
    local players = instance:getChars();
    local lastTimeUpdate = instance:getLastTimeUpdate();
    local remainingTimeLimit = (instance:getTimeLimit()) * 60 - (elapsed / 1000);
    local wipeTime = instance:getWipeTime();
    local message = 0;
    
    if (remainingTimeLimit < 0) then
        instance:fail();
        return;
    end
    
    if (wipeTime == 0) then
        local wipe = true;
        for i,v in pairs(players) do
            if v:getHP() ~= 0 then
                wipe = false;
                break;
            end
        end
        if (wipe) then
            for i,v in pairs(players) do
                v:messageSpecial(Leujaoam.text.PARTY_FALLEN, 3);
            end
            instance:setWipeTime(elapsed);
        end
    else
        if (elapsed - wipeTime) / 1000 > 180 then
            instance:fail();
            return;
        else
            for i,v in pairs(players) do
                if v:getHP() ~= 0 then
                    instance:setWipeTime(0);
                    break;
                end
            end
        end
    end
    
    if (lastTimeUpdate == 0 and elapsed > 20 * 60000) then
        message = 600;
    elseif (lastTimeUpdate == 600 and remainingTimeLimit < 300) then
        message = 300;
    elseif (lastTimeUpdate == 300 and remainingTimeLimit < 60) then
        message = 60;
    elseif (lastTimeUpdate == 60 and remainingTimeLimit < 30) then
        message = 30;
    elseif (lastTimeUpdate == 30 and remainingTimeLimit < 10) then
        message = 10;
    end
    
    if (message ~= 0) then
        for i,v in pairs(players) do
            if (remainingTimeLimit >= 60) then
                v:messageSpecial(Leujaoam.text.TIME_REMAINING_MINUTES, remainingTimeLimit / 60);
            else
                v:messageSpecial(Leujaoam.text.TIME_REMAINING_SECONDS, remainingTimeLimit);
            end
        end
        instance:setLastTimeUpdate(message);
    end
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
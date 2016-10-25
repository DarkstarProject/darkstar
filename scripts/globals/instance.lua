require("scripts/globals/status");

function disengageAll(instance, stunTime, disableAggro, freezeMobs)
    if (instance == nil) then
        print("disengageAll: Error, null instance. Aborting...");
    end

    if (stunTime == nil) then
        stunTime = 10000;
    end

    if (disableAggro == nil) then
        disableAggro = true;
    end

    if (freezeMobs == nil) then
        freezeMobs = true;
    end

    local players = instance:getChars();
    doDisengageAll(players, stunTime, disableAggro, freezeMobs);
    local allies = instance:getAllies();
    doDisengageAll(allies, stunTime, disableAggro, freezeMobs);
    local mobs = instance:getMobs();
    doDisengageAll(mobs, stunTime, disableAggro, freezeMobs);
end

function doDisengageAll(entities, stunTime, disableAggro, freezeMobs)
    for i,entity in pairs(entities) do
        if (entity:isAlive()) then
            if(entity:isMob()) then
                if (disableAggro) then
                    entity:setAggressive(false);
                end

                if (freezeMobs) then
                    entity:setMobMod(MOBMOD_NO_MOVE, 1);
                end

                entity:clearAllEnmity();
            end

            entity:disengage();

            if(entity:isMob()) then
                entity:stun(stunTime);
            end
        end
    end
end

function updateInstanceTime(instance, elapsed, texttable)
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
                v:messageSpecial(texttable.PARTY_FALLEN, 3);
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

    if (lastTimeUpdate == 0 and remainingTimeLimit < 600) then
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
                v:messageSpecial(texttable.TIME_REMAINING_MINUTES, remainingTimeLimit / 60);
            else
                v:messageSpecial(texttable.TIME_REMAINING_SECONDS, remainingTimeLimit);
            end
        end
        instance:setLastTimeUpdate(message);
    end
end

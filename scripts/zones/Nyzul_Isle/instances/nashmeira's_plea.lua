-----------------------------------
--
-- TOAU-42: Path of Darkness
--
-----------------------------------

require("scripts/globals/instance")
require("scripts/globals/keyitems");
require("scripts/zones/Nyzul_Isle/IDs");

-----------------------------------
-- afterInstanceRegister
-----------------------------------

function afterInstanceRegister(player)
    local instance = player:getInstance();
    player:messageSpecial(NyzulIsle.text.TIME_TO_COMPLETE, instance:getTimeLimit());
end;

-----------------------------------
-- onInstanceCreated
-----------------------------------

function onInstanceCreated(instance)
    SpawnMob(NyzulIsle.mobs[59].RAUBAHN, instance);
    SpawnMob(NyzulIsle.mobs[59].RAZFAHD, instance);
end;

-----------------------------------
-- onInstanceTimeUpdate
-----------------------------------

function onInstanceTimeUpdate(instance, elapsed)
    updateInstanceTime(instance, elapsed, NyzulIsle.text)
end;

-----------------------------------
-- onInstanceFailure
-----------------------------------

function onInstanceFailure(instance)
    local chars = instance:getChars();

    for i,v in pairs(chars) do
        v:messageSpecial(NyzulIsle.text.MISSION_FAILED,10,10);
        v:startEvent(1);
    end
end;

-----------------------------------
-- onInstanceProgressUpdate
-----------------------------------

function onInstanceProgressUpdate(instance, progress)
    if (progress == 4) then
        local chars = instance:getChars();

        for i,v in pairs(chars) do
            v:startEvent(203);
        end

        DespawnMob(NyzulIsle.mobs[59].RAZFAHD, instance);
        SpawnMob(NyzulIsle.mobs[59].ALEXANDER, instance);

    elseif(progress == 5) then
        instance:complete();
    end
end;

-----------------------------------
-- onInstanceComplete
-----------------------------------

function onInstanceComplete(instance)

    local chars = instance:getChars();

    for i,v in pairs(chars) do
        if (v:getCurrentMission(TOAU) == NASHMEIRAS_PLEA and v:getVar("AhtUrganStatus") == 1) then
            v:setVar("AhtUrganStatus", 2);
        end

        v:setPos(0,0,0,0,72);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    printf("Update CSID: %u",csid);
    printf("Update RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    printf("Finish CSID: %u",csid);
    printf("Finish RESULT: %u",option);

    if(csid == 203) then
        player:setPos(-444,-4,420,127);
    end
end;


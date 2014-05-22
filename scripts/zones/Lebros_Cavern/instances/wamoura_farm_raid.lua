-----------------------------------
-- 
-- Assault: Wamoura Farm Raid
-- 
-----------------------------------

require("scripts/zones/Lebros_Cavern/IDs");

-----------------------------------
-- afterInstanceRegister
-----------------------------------

function afterInstanceRegister(player)
    local instance = player:getInstance();
    player:messageSpecial(Lebros.text.ASSAULT_27_START, 27);
    player:messageSpecial(Lebros.text.TIME_TO_COMPLETE, instance:getTimeLimit());
end;	

-----------------------------------
-- onInstanceCreated
-----------------------------------

function onInstanceCreated(instance)

    for i,v in pairs(Lebros.mobs[27]) do
        SpawnMob(v, instance);
    end

end;

-----------------------------------
-- onInstanceTimeUpdate
-----------------------------------

function onInstanceTimeUpdate(instance, timeRemaining)
    local players = instance:getChars();
    for i,v in pairs(players) do
        if (timeRemaining >= 60) then
            v:messageSpecial(Lebros.text.TIME_REMAINING_MINUTES, timeRemaining / 60);
        else
            v:messageSpecial(Lebros.text.TIME_REMAINING_SECONDS, timeRemaining);
        end
    end
end;

-----------------------------------
-- onInstanceFailure
-----------------------------------

function onInstanceFailure(player)
    player:messageSpecial(Lebros.text.MISSION_FAILED,10,10);
    player:startEvent(0x66);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    if (csid == 0x66) then
        player:setPos(0,0,0,0,61);
    end
end;
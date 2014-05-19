-----------------------------------
-- 
-- Assault: Wamoura Farm Raid
-- 
-----------------------------------

package.loaded["scripts/zones/Lebros_Cavern/TextIDs"] = nil;
require("scripts/zones/Lebros_Cavern/TextIDs");

-----------------------------------
-- afterInstanceRegister
-----------------------------------

function afterInstanceRegister(player)
    local instance = player:getInstance();
    player:messageSpecial(ASSAULT_27_START, 27);
    player:messageSpecial(TIME_TO_COMPLETE, instance:getTimeLimit());
end;	

-----------------------------------
-- onInstanceTimeUpdate
-----------------------------------

function onInstanceTimeUpdate(instance, timeRemaining)
    local players = instance:getChars();
    for i,v in pairs(players) do
        if (timeRemaining >= 60) then
            v:messageSpecial(TIME_REMAINING_MINUTES, timeRemaining / 60);
        else
            v:messageSpecial(TIME_REMAINING_SECONDS, timeRemaining);
        end
    end
end;

-----------------------------------
-- onInstanceFailure
-----------------------------------

function onInstanceFailure(player)
    player:messageSpecial(MISSION_FAILED,10,10);
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
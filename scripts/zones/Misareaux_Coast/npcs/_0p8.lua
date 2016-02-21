-----------------------------------
--  Area: Misareaux Coast
--  NPC:  Iron Gate
--  Entrance to Sacrarium
-----------------------------------
package.loaded["scripts/zones/Misareaux_Coast/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Misareaux_Coast/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)

    local currentCoP = player:getCurrentMission(COP);
    local PromathiaStatus = player:getVar("PromathiaStatus");
    
    if (currentCoP == THE_SECRETS_OF_WORSHIP and PromathiaStatus == 1) then
        player:startEvent(0x0009);
    elseif (player:hasCompletedMission(COP,THE_LAST_VERSE) or (currentCoP == THE_SECRETS_OF_WORSHIP and PromathiaStatus >= 2)or(currentCoP > THE_SECRETS_OF_WORSHIP)) then
        player:startEvent(0x01f6);
    else
        player:messageSpecial(DOOR_CLOSED);
    end
    return 1;
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
    if (csid == 0x0009 and option == 1) then
        player:setVar("PromathiaStatus",2);
        player:setPos(-220.075,-15.999,79.634,62,28); -- To Sacrarium {R}
    elseif (csid == 0x01f6 and option == 1) then
        player:setPos(-220.075,-15.999,79.634,62,28); -- To Sacrarium {R}
    end
    
end;
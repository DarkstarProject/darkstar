-----------------------------------
-- Area: Misareaux Coast
--  NPC: Iron Gate
--  Entrance to Sacrarium
-----------------------------------
package.loaded["scripts/zones/Misareaux_Coast/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/zones/Misareaux_Coast/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local currentCoP = player:getCurrentMission(COP);
    local PromathiaStatus = player:getVar("PromathiaStatus");

    if (currentCoP == THE_SECRETS_OF_WORSHIP and PromathiaStatus == 1) then
        player:startEvent(9);
    elseif (player:hasCompletedMission(COP,THE_LAST_VERSE) or (currentCoP == THE_SECRETS_OF_WORSHIP and PromathiaStatus >= 2)or(currentCoP > THE_SECRETS_OF_WORSHIP)) then
        player:startEvent(502);
    else
        player:messageSpecial(DOOR_CLOSED);
    end
    return 1;
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 9 and option == 1) then
        player:setVar("PromathiaStatus",2);
        player:setPos(-220.075,-15.999,79.634,62,28); -- To Sacrarium {R}
    elseif (csid == 502 and option == 1) then
        player:setPos(-220.075,-15.999,79.634,62,28); -- To Sacrarium {R}
    end

end;
-----------------------------------
--  NPC: _0s8 (Wooden Gate)
-- Area: Sacrarium
-- Involved in Mission: Secrets of Worship
-- !pos 45.500 -1.500 10.000 28
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/missions");
-----------------------------------

function onTrigger(player,npc)

    if (player:getXPos() > 45) then
        if (player:getCurrentMission(COP) == THE_SECRETS_OF_WORSHIP and player:getVar("PromathiaStatus") == 2) then
            player:startEvent(6,0,582);
        elseif (player:getCurrentMission(COP) == THE_SECRETS_OF_WORSHIP and player:getVar("PromathiaStatus") == 4 and player:hasKeyItem(RELIQUIARIUM_KEY) == true) then
            player:startEvent(5);
        elseif (player:hasKeyItem(RELIQUIARIUM_KEY) == true) then
            player:startEvent(110);
        end
    else
        player:messageSpecial(CANNOT_OPEN_SIDE);
    end
    return 1;
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    if (csid == 6) then
        player:setVar("PromathiaStatus",3);
    elseif (csid == 5) then
        player:setVar("PromathiaStatus",0);
        player:completeMission(COP,THE_SECRETS_OF_WORSHIP);
        player:addMission(COP,SLANDEROUS_UTTERINGS);
    end
end;

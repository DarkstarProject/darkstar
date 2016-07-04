-----------------------------------
-- NPC:  _0s8 (Wooden Gate)
-- Area: Sacrarium
-- Involved in Mission: Secrets of Worship
-- @pos 45.500 -1.500 10.000 28
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getXPos() > 45) then
        if (player:getCurrentMission(COP) == THE_SECRETS_OF_WORSHIP and player:getVar("PromathiaStatus") == 2) then
            player:startEvent(0x0006,0,582);
        elseif (player:getCurrentMission(COP) == THE_SECRETS_OF_WORSHIP and player:getVar("PromathiaStatus") == 4 and player:hasKeyItem(RELIQUIARIUM_KEY)==true) then 
            player:startEvent(0x0005);
        elseif (player:hasKeyItem(RELIQUIARIUM_KEY)==true) then
            player:startEvent(0x006E);
        end
    else
        player:messageSpecial(CANNOT_OPEN_SIDE);
    end    
    return 1;
end;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    if (csid == 0x0006) then
        player:setVar("PromathiaStatus",3);
    elseif (csid == 0x0005) then
        player:setVar("PromathiaStatus",0);
        player:completeMission(COP,THE_SECRETS_OF_WORSHIP);
        player:addMission(COP,SLANDEROUS_UTTERINGS); 
    end
end;

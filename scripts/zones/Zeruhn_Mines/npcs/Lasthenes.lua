-----------------------------------
-- Area: Zeruhn Mines
--  NPC: Lasthenes
-- Notes: Opens Gate
-----------------------------------
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getXPos() > -79.5 ) then
        player:startEvent(180);
    else
        player:startEvent(181);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
-----------------------------------
-- Area: Windurst Woods
--  NPC: Wani Casdohry
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/zones/Windurst_Woods/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)

TwinstoneBonding = player:getQuestStatus(WINDURST,TWINSTONE_BONDING);

    if (TwinstoneBonding == QUEST_COMPLETED) then
        player:startEvent(492,0,13360);
    elseif (TwinstoneBonding == QUEST_ACCEPTED) then
        player:startEvent(489,0,13360);
    else
        player:startEvent(425);
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


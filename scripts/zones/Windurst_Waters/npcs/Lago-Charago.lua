-----------------------------------
-- Area: Windurst Waters
--  NPC: Lago-Charago
-- Type: Adventurer's Assistant
-- !pos -57.271 -11.75 92.503 238
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/zones/Windurst_Waters/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local WildcatWindurst = player:getVar("WildcatWindurst");

    if (player:getQuestStatus(WINDURST,LURE_OF_THE_WILDCAT_WINDURST) == QUEST_ACCEPTED and player:getMaskBit(WildcatWindurst,11) == false) then
        player:startEvent(940);
    else
        player:startEvent(300);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 940) then
        player:setMaskBit(player:getVar("WildcatWindurst"),"WildcatWindurst",11,true);
    end

end;


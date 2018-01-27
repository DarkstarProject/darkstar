-----------------------------------
-- Area: Windurst Waters
--  NPC: Amagusa-Chigurusa
-- Type: Standard NPC
-- !pos -28.746 -4.5 61.954 238
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

    if (player:getQuestStatus(WINDURST,LURE_OF_THE_WILDCAT_WINDURST) == QUEST_ACCEPTED and player:getMaskBit(WildcatWindurst,12) == false) then
        player:startEvent(937);
    else
        player:startEvent(562);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 937) then
        player:setMaskBit(player:getVar("WildcatWindurst"),"WildcatWindurst",12,true);
    end

end;


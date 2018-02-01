-----------------------------------
-- Area: Windurst Woods
--  NPC: Cayu Pensharhumi
-- Type: Standard NPC
-- !pos 39.437 -0.91 -40.808 241
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/zones/Windurst_Woods/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local WildcatWindurst = player:getVar("WildcatWindurst");

    if (player:getQuestStatus(WINDURST,LURE_OF_THE_WILDCAT_WINDURST) == QUEST_ACCEPTED and player:getMaskBit(WildcatWindurst,2) == false) then
        player:startEvent(733);
    else
        player:startEvent(259);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 733) then
        player:setMaskBit(player:getVar("WildcatWindurst"),"WildcatWindurst",2,true);
    end

end;


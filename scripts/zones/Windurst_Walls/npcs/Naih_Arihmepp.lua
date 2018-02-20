-----------------------------------
-- Area: Windurst Walls
--  NPC: Naih Arihmepp
-- Type: Standard NPC
-- !pos -64.578 -13.465 202.147 239
-----------------------------------
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/zones/Windurst_Walls/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local WildcatWindurst = player:getVar("WildcatWindurst");

    if (player:getQuestStatus(WINDURST,LURE_OF_THE_WILDCAT_WINDURST) == QUEST_ACCEPTED and player:getMaskBit(WildcatWindurst,9) == false) then
        player:startEvent(500);
    else
        player:startEvent(326);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 500) then
        player:setMaskBit(player:getVar("WildcatWindurst"),"WildcatWindurst",9,true);
    end

end;


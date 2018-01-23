-----------------------------------
-- Area: Windurst Woods
--  NPC: Soni-Muni
-- Starts & Finishes Quest: The Amazin' Scorpio
-- !pos -17.073 1.749 -59.327 241
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/zones/Windurst_Woods/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    local AmazinScorpio = player:getQuestStatus(WINDURST,THE_AMAZIN_SCORPIO);

    if (AmazinScorpio == QUEST_ACCEPTED) then
        local count = trade:getItemCount();
        local ScorpionStinger = trade:hasItemQty(1017,1);

        if (ScorpionStinger == true and count == 1) then
            player:startEvent(484);
        end
    end

end;

function onTrigger(player,npc)

    local AmazinScorpio = player:getQuestStatus(WINDURST,THE_AMAZIN_SCORPIO);
    local Fame = player:getFameLevel(WINDURST);
    local WildcatWindurst = player:getVar("WildcatWindurst");

    if (player:getQuestStatus(WINDURST,LURE_OF_THE_WILDCAT_WINDURST) == QUEST_ACCEPTED and player:getMaskBit(WildcatWindurst,0) == false) then
        player:startEvent(735);
    elseif (AmazinScorpio == QUEST_COMPLETED) then
        player:startEvent(485);
    elseif (AmazinScorpio == QUEST_ACCEPTED) then
        player:startEvent(482,0,0,1017);
    elseif (AmazinScorpio == QUEST_AVAILABLE and Fame >= 2) then
        player:startEvent(481,0,0,1017);
    else
        player:startEvent(421);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 481) then
        player:addQuest(WINDURST,THE_AMAZIN_SCORPIO);
    elseif (csid == 484) then
        player:completeQuest(WINDURST,THE_AMAZIN_SCORPIO);
        player:addFame(WINDURST,80);
        player:addTitle(GREAT_GRAPPLER_SCORPIO);
        player:addGil(GIL_RATE*1500);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*1500);
        player:tradeComplete();
    elseif (csid == 735) then
        player:setMaskBit(player:getVar("WildcatWindurst"),"WildcatWindurst",0,true);
    end

end;





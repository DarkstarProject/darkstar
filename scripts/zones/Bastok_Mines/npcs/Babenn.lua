-----------------------------------
-- Area: Bastok Mines
-- NPC:  Babenn
-- Finishes Quest: The Eleventh's Hour
-- Involved in Quests: Riding on the Clouds
-- @zone 234
-- @pos 73 -1 34
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_2") == 1) then
        if (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
            player:setVar("ridingOnTheClouds_2",0);
            player:tradeComplete();
            player:addKeyItem(SMILING_STONE);
            player:messageSpecial(KEYITEM_OBTAINED,SMILING_STONE);
        end
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getQuestStatus(BASTOK,THE_ELEVENTH_S_HOUR) == QUEST_ACCEPTED and player:getVar("EleventhsHour") == 1) then
        player:startEvent(0x002d);
    else
        player:startEvent(0x0028);
    end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x002d) then

        if (player:getFreeSlotsCount() > 1) then
            player:setVar("EleventhsHour",0);
            player:delKeyItem(OLD_TOOLBOX);
            player:addTitle(PURSUER_OF_THE_TRUTH);
            player:addItem(16629);
            player:messageSpecial(ITEM_OBTAINED,16629);
            player:addFame(BASTOK,30);
            player:completeQuest(BASTOK,THE_ELEVENTH_S_HOUR);
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 16629);
        end
    end

end;
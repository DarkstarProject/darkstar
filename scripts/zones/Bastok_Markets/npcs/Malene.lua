-----------------------------------
-- Area: Bastok Markets
--  NPC: Malene
-- Type: Quest NPC
-- !pos -173 -4 64 235
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
      if (trade:hasItemQty(550, 1) and trade:getItemCount() == 1) then -- Quest: The Cold Light of Day - Trade Steam Clock
        if (player:getQuestStatus(BASTOK, THE_COLD_LIGHT_OF_DAY) ~= QUEST_AVAILABLE) then
            player:startEvent(104);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getQuestStatus(BASTOK, WISH_UPON_A_STAR) == QUEST_ACCEPTED and player:getVar("WishUponAStar_Status") == 1) then -- Quest: Wish Upon a Star
        player:startEvent(330);
    else -- Quest: The Cold Light of Day
        player:startEvent(102);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 102) then -- Quest: The Cold Light of Day
        if (player:getQuestStatus(BASTOK, THE_COLD_LIGHT_OF_DAY) == QUEST_AVAILABLE) then
            player:addQuest(BASTOK, THE_COLD_LIGHT_OF_DAY);
        end
    elseif (csid == 104) then -- Quest: The Cold Light of Day - Traded Steam Clock
        player:tradeComplete( );
        player:addTitle(CRAB_CRUSHER);
        player:addGil(GIL_RATE*500);
        player:messageSpecial(GIL_OBTAINED, GIL_RATE*500);

        if (player:getQuestStatus(BASTOK, THE_COLD_LIGHT_OF_DAY) == QUEST_ACCEPTED) then
            player:addFame(BASTOK, 50);
            player:completeQuest(BASTOK, THE_COLD_LIGHT_OF_DAY);
        else
            player:addFame(BASTOK, 8);
        end
    elseif (csid == 330) then  -- Quest: Wish Upon a Star
        player:setVar("WishUponAStar_Status", 2);
    end
end;

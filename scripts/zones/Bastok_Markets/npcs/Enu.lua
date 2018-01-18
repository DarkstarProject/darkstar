-----------------------------------
-- Area: Bastok Markets
--  NPC: Enu
-- Type: Quest NPC
-- !pos -253.673 -13 -92.326 235
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/weather");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
      if (trade:hasItemQty(1192, 1) and trade:getItemCount() == 1) then -- Quest: Wish Upon a Star - Trade Fallen Star
        if (player:getVar("WishUponAStar_Status") == 3) then
            if (player:getWeather() == WEATHER_NONE and  (VanadielTOTD() == TIME_NIGHT or VanadielTOTD() == TIME_MIDNIGHT)) then
                player:startEvent(334); -- Trade accepeted
            else
                player:startEvent(337); -- Player has to wait for clear weather
            end
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getQuestStatus(BASTOK, WISH_UPON_A_STAR) == QUEST_COMPLETED) then -- Quest: Wish Upon a Star - Quest has been completed.
        player:startEvent(335);
    elseif (player:getVar("WishUponAStar_Status") == 2) then -- Quest: Wish Upon a Star - Player has spoken with Malene
        player:startEvent(332);
    elseif (player:getVar("WishUponAStar_Status") == 3) then -- Quest: Wish Upon a Star - Enu has asked player to give her a fallen star
        player:startEvent(333);
    else -- Standard dialog
        player:startEvent(327);
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
    -- printf ("CSID: %u",csid);
    -- printf ("RESULT: %u",option);
    if (csid == 332) then -- Quest: Wish Upon a Star
        player:setVar("WishUponAStar_Status",3);
    elseif (csid == 334) then -- Quest: Wish Upon a Star - Traded Fallen Star
        player:tradeComplete( );
        player:completeQuest(BASTOK,WISH_UPON_A_STAR);
        player:setVar("WishUponAStar_Status",0);
        player:addFame(BASTOK,50);
        player:addItem(1236,4); -- Reward for quest completion: Cactus Stems x 4
        player:messageSpecial(ITEM_OBTAINED,1236);
    end
end;

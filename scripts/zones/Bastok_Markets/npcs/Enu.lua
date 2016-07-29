-----------------------------------
-- Area: Bastok Markets
--   NPC: Enu
--  Type: Quest NPC
-- @zone: 235
--  @pos -253.673 -13 -92.326
-----------------------------------

package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;

require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/weather");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

      if (trade:hasItemQty(1192, 1) and trade:getItemCount() == 1) then -- Quest: Wish Upon a Star - Trade Fallen Star
        if (player:getVar("WishUponAStar_Status") == 3) then
            if (player:getWeather() ~= WEATHER_NONE and  (VanadielTOTD() == TIME_NIGHT or VanadielTOTD() == TIME_MIDNIGHT)) then
                player:startEvent(0x0151); -- Player has to wait for clear weather
            else
                player:startEvent(0x014E); -- Trade accepted
            end
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getQuestStatus(BASTOK, WISH_UPON_A_STAR) == QUEST_COMPLETED) then -- Quest: Wish Upon a Star - Quest has been completed.
        player:startEvent(0x014F);
    elseif (player:getVar("WishUponAStar_Status") == 2) then -- Quest: Wish Upon a Star - Player has spoken with Malene
        player:startEvent(0x014C);
    elseif (player:getVar("WishUponAStar_Status") == 3) then -- Quest: Wish Upon a Star - Enu has asked player to give her a fallen star
        player:startEvent(0x014D);
    else -- Standard dialog
        player:startEvent(0x0147);
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

    if (csid == 0x014C) then -- Quest: Wish Upon a Star
        player:setVar("WishUponAStar_Status",3);
    elseif (csid == 0x014e) then -- Quest: Wish Upon a Star - Traded Fallen Star
        player:tradeComplete( );

        player:addItem(1236,4); -- Reward for quest completion: Cactus Stems x 4 
        player:messageSpecial(ITEM_OBTAINED,1236);

        player:addFame(BASTOK,50);
        player:completeQuest(BASTOK,WISH_UPON_A_STAR);
        player:setVar("WishUponAStar_Status",0);
    end
end;

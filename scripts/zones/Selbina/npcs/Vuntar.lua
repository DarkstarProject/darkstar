-----------------------------------
-- Area: Selbina
--  NPC: Vuntar
-- Starts and Finishes Quest: Cargo (R)
-- !pos 7 -2 -15 248
-----------------------------------
local ID = require("scripts/zones/Selbina/IDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(OTHER_AREAS_LOG,CARGO) ~= QUEST_AVAILABLE) then
        realday = tonumber(os.date("%j")); -- %M for next minute, %j for next real day
        starttime = player:getVar("VuntarCanBuyItem_date");

        if (realday ~= starttime) then
            if (trade:hasItemQty(4529,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then
                player:startEvent(52,1); -- Can Buy rolanberry (881 ce)

            elseif (trade:hasItemQty(4530,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then
                player:startEvent(52,2); -- Can Buy rolanberry (874 ce)

            elseif (trade:hasItemQty(4531,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then
                player:startEvent(52,3); -- Can Buy rolanberry (864 ce)

            end
        else
            player:startEvent(1134,4365); -- Can't buy rolanberrys
        end
    end
end;

function onTrigger(player,npc)
    if (player:getMainLvl() >= 20 and player:getQuestStatus(OTHER_AREAS_LOG,CARGO) == QUEST_AVAILABLE) then
        player:startEvent(50,4365); -- Start quest "Cargo"
    elseif (player:getMainLvl() < 20) then
        player:startEvent(53); -- Dialog for low level or low fame
    else
        player:startEvent(51,4365); -- During & after completed quest "Cargo"
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 50) then
        player:addQuest(OTHER_AREAS_LOG,CARGO);
    elseif (csid == 52) then
        player:setVar("VuntarCanBuyItem_date", os.date("%j")); -- %M for next minute, %j for next real day
        if (player:getQuestStatus(OTHER_AREAS_LOG,CARGO) == QUEST_ACCEPTED) then
            player:completeQuest(OTHER_AREAS_LOG,CARGO);
            player:addFame(SELBINA,30);
        end
        if (option == 1) then
            player:addGil(800);
            player:messageSpecial(ID.text.GIL_OBTAINED,800);
            player:tradeComplete();
        elseif (option == 2) then
            player:addGil(2000);
            player:messageSpecial(ID.text.GIL_OBTAINED,2000);
            player:tradeComplete();
        elseif (option == 3) then
            player:addGil(3000);
            player:messageSpecial(ID.text.GIL_OBTAINED,3000);
            player:tradeComplete();
        end
    end
end;

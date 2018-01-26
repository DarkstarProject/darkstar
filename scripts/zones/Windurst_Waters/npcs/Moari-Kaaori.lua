-----------------------------------
-- Area: Windurst Waters
--  NPC: Moari-Kaaori
-- Working 100%
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Waters/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
    local SayFlowers = player:getQuestStatus(WINDURST,SAY_IT_WITH_FLOWERS);
    local FlowerProgress = player:getVar("FLOWER_PROGRESS");
    local offer = trade:getItemId();

    if (FlowerProgress == 3) then
        if (trade:hasItemQty(950, 1) and trade:getItemCount() == 1) then
            if (SayFlowers == QUEST_COMPLETED) then
                player:startEvent(525,GIL_RATE*400);
            else
                player:startEvent(520);
            end
        elseif (offer == 941 or offer == 948 or offer == 949 or offer == 956 or offer == 957 or offer == 958) then
            player:startEvent(522); -- Brought wrong flowers.
        end
    end
end;

function onTrigger(player,npc)
    local SayFlowers = player:getQuestStatus(WINDURST,SAY_IT_WITH_FLOWERS);
    local FlowerProgress = player:getVar("FLOWER_PROGRESS");
    local NeedToZone = player:needToZone();

    if (FlowerProgress == 3 or FlowerProgress == 1) then
        player:startEvent(515); -- Waiting for trade.
    elseif (SayFlowers == QUEST_COMPLETED and NeedToZone == true and FlowerProgress == 0) then -- Must zone to retry quest.
        player:startEvent(521);
    elseif (SayFlowers == QUEST_COMPLETED and NeedToZone == false and FlowerProgress == 0) then
        player:startEvent(514); -- Repeat Say It with Flowers.
    elseif (SayFlowers == QUEST_AVAILABLE and player:getFameLevel(WINDURST) >= 2) then
        player:startEvent(523); -- Begin Say It with Flowers.
    else
        player:startEvent(512);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 514 and option == 1) then
        if (player:getQuestStatus(WINDURST,SAY_IT_WITH_FLOWERS) == QUEST_COMPLETED) then
            player:setVar("FLOWER_PROGRESS",1);
        else
            player:addQuest(WINDURST,SAY_IT_WITH_FLOWERS);
            player:setVar("FLOWER_PROGRESS",1);
        end
    elseif (csid == 520) then -- First completion, Iron Sword awarded.
        if (player:getFreeSlotsCount() > 0) then
            player:tradeComplete();
            player:addItem(16536);
            player:completeQuest(WINDURST,SAY_IT_WITH_FLOWERS);
            player:addFame(WINDURST,30);
            player:messageSpecial(ITEM_OBTAINED,16536);
            player:setVar("FLOWER_PROGRESS",0);
            player:needToZone(true);
            player:setTitle(CUPIDS_FLORIST);
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,16536);
        end
    elseif (csid == 522) then -- Wrong flowers so complete quest, but smaller reward/fame and no title.
        player:completeQuest(WINDURST,SAY_IT_WITH_FLOWERS);
        player:tradeComplete();
        player:addGil(GIL_RATE * 100);
        player:messageSpecial(GIL_OBTAINED,100);
        player:addFame(WINDURST,10);
        player:needToZone(true);
        player:setVar("FLOWER_PROGRESS",0);
    elseif (csid == 525) then -- Repeatable quest rewards.
        player:tradeComplete();
        player:addFame(WINDURST,30);
        player:addGil(GIL_RATE * 400);
        player:setVar("FLOWER_PROGRESS",0);
        player:needToZone(true);
        player:setTitle(CUPIDS_FLORIST);
    elseif (csid == 523) then
        player:setVar("FLOWER_PROGRESS",1);
    end
end;




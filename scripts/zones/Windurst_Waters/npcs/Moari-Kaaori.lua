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
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local SayFlowers = player:getQuestStatus(WINDURST,SAY_IT_WITH_FLOWERS);
    local FlowerProgress = player:getVar("FLOWER_PROGRESS");
    local offer = trade:getItem();
    
    if (player:getVar("FLOWER_PROGRESS") == 2) then
        if (trade:hasItemQty(950, 1) and trade:getItemCount() == 1) then
            if (SayFlowers == QUEST_COMPLETED) then
                player:startEvent(0x020D,GIL_RATE*400);
            elseif (SayFlowers == QUEST_ACCEPTED) then
                player:startEvent(0x0208);
            end
        elseif (offer == 941 or offer == 948 or offer == 949 or offer == 956 or offer == 957 or offer == 958) then
            player:startEvent(0x020A); -- Brought wrong flowers.
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local SayFlowers = player:getQuestStatus(WINDURST,SAY_IT_WITH_FLOWERS);
    local FlowerProgress = player:getVar("FLOWER_PROGRESS");
    local zoned = player:getLocalVar("FLOWER_ZONE");
    
    if (FlowerProgress == 2) then
        player:startEvent(0x0203); -- Waiting for trade.
    elseif (zoned == 1) then -- Must zone to retry quest.
        player:startEvent(0x0209);
    elseif (SayFlowers == QUEST_AVAILABLE and player:getFameLevel(WINDURST) >= 2) then
        player:startEvent(0x0202); -- Begin Say It with Flowers.
    elseif (SayFlowers == QUEST_COMPLETED and zoned == 0) then
        player:startEvent(0x020B); -- Repeat Say It with Flowers.
    else
        player:startEvent(0x0200);
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

    if (csid == 0x0202 and option == 1) then
        if (player:getQuestStatus(WINDURST,SAY_IT_WITH_FLOWERS) == QUEST_COMPLETED) then
            player:setVar("FLOWER_PROGRESS",2);
        else
            player:addQuest(WINDURST,SAY_IT_WITH_FLOWERS);
        end
    elseif (csid == 0x0208) then -- First completion, Iron Sword awarded.
        player:tradeComplete();
        player:completeQuest(WINDURST,SAY_IT_WITH_FLOWERS);
        player:addFame(WINDURST,30);
        player:addItem(16536);
        player:messageSpecial(ITEM_OBTAINED,16536);
        player:setVar("FLOWER_PROGRESS",0);
        player:setLocalVar("FLOWER_ZONE",1);
        player:setTitle(CUPIDS_FLORIST);
    elseif (csid == 0x020A) then -- Wrong flowers so complete quest, but smaller reward/fame and no title.
        player:completeQuest(WINDURST,SAY_IT_WITH_FLOWERS);
        player:tradeComplete();
        player:addGil(100);
        player:messageSpecial(GIL_OBTAINED,100);
        player:addFame(WINDURST,10);
        player:setLocalVar("FLOWER_ZONE",1);
        player:setVar("FLOWER_PROGRESS",0);
    elseif (csid == 0x020D) then -- Repeatable quest rewards.
        player:tradeComplete();
        player:addFame(WINDURST,30);
        player:addGil(GIL_RATE*400);
        player:setVar("FLOWER_PROGRESS",0);
        player:setLocalVar("FLOWER_ZONE",1);
        player:setTitle(CUPIDS_FLORIST);
    elseif (csid == 0x020B) then
        player:setVar("FLOWER_PROGRESS",2);
    end
end;




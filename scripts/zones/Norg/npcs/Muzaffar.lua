-----------------------------------
-- Area: Norg
--  NPC: Muzaffar
-- Standard Info NPC
-- Quests: Black Market
-- @pos 16.678, -2.044, -14.600 252
-----------------------------------
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Norg/TextIDs");
require("scripts/globals/titles");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local count = trade:getItemCount();
    local NorthernFurs = trade:hasItemQty(1199,4);
    local EasternPottery = trade:hasItemQty(1200,4);
    local SouthernMummies = trade:hasItemQty(1201,4);
    if (player:getQuestStatus(NORG,BLACK_MARKET) == QUEST_ACCEPTED or player:getQuestStatus(NORG,BLACK_MARKET) == QUEST_COMPLETED) then
        if (NorthernFurs and count == 4) then
            player:tradeComplete();
            player:startEvent(0x0011, 1199, 1199);
        elseif (EasternPottery and count == 4) then
            player:tradeComplete();
            player:startEvent(0x0012, 1200, 1200);
        elseif (SouthernMummies and count == 4) then
            player:tradeComplete();
            player:startEvent(0x0013, 1201, 1201);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getQuestStatus(NORG,BLACK_MARKET) == QUEST_ACCEPTED or player:getQuestStatus(NORG,BLACK_MARKET) == QUEST_COMPLETED) then
        player:startEvent(0x0010);
    else
        player:startEvent(0x000F);
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
    if (csid == 0x000F and option == 1) then
        player:addQuest(NORG,BLACK_MARKET);
    elseif (csid == 0x0011) then
        player:addGil(GIL_RATE*1500);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*1500);
        if (player:getQuestStatus(NORG,BLACK_MARKET) == QUEST_ACCEPTED) then
            player:completeQuest(NORG,BLACK_MARKET);
        end
        player:addFame(NORG,40);
        player:addTitle(BLACK_MARKETEER);
        player:startEvent(0x0014);
    elseif (csid == 0x0012) then
        player:addGil(GIL_RATE*2000);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*2000);
        if (player:getQuestStatus(NORG,BLACK_MARKET) == QUEST_ACCEPTED) then
            player:completeQuest(NORG,BLACK_MARKET);
        end
        player:addFame(NORG,50);
        player:addTitle(BLACK_MARKETEER);
        player:startEvent(0x0014);
    elseif (csid == 0x0013) then
        player:addGil(GIL_RATE*3000);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*3000);
        if (player:getQuestStatus(NORG,BLACK_MARKET) == QUEST_ACCEPTED) then
            player:completeQuest(NORG,BLACK_MARKET);
        end
        player:addFame(NORG,80);
        player:addTitle(BLACK_MARKETEER);
        player:startEvent(0x0014);
    end
end;
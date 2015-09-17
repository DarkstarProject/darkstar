-----------------------------------
--  Area: Mhaura
--  NPC:  Orlando
--  Type: Standard NPC
--  @pos -37.268 -9 58.047 249
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Mhaura/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local QuestStatus = player:getQuestStatus(OTHER_AREAS, ORLANDO_S_ANTIQUES);
    local itemID = trade:getItem();
    local itemList =
    {
        {564, 200},   -- Fingernail Sack
        {565, 250},   -- Teeth Sack
        {566, 200},   -- Goblin Cup
        {568, 120},   -- Goblin Die
        {656, 600},   -- Beastcoin
        {748, 900},   -- Gold Beastcoin
        {749, 800},   -- Mythril Beastcoin
        {750, 750},   -- Silver Beastcoin
        {898, 120},   -- Chicken Bone
        {900, 100},   -- Fish Bone
        {16995, 150}, -- Rotten Meat
    };
 
    for x, item in pairs(itemList) do
        if (QuestStatus == QUEST_ACCEPTED) or (player:getLocalVar("OrlandoRepeat") == 1) then
            if (item[1] == itemID) then
                if (trade:hasItemQty(itemID, 8) and trade:getItemCount() == 8) then
                -- Correct amount, valid item.
                    player:setVar("ANTIQUE_PAYOUT", (GIL_RATE*item[2]));
                    player:startEvent(0x0066, GIL_RATE*item[2], itemID);
                elseif (trade:getItemCount() < 8) then
                 -- Wrong amount, but valid item.
                    player:startEvent(0x0068);
                end
            end
        end
    end    
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local QuestStatus = player:getQuestStatus(OTHER_AREAS, ORLANDO_S_ANTIQUES);
    
    if (player:getFameLevel(WINDURST) >= 2) then
        if (player:hasKeyItem(CHOCOBO_LICENSE)) then
            if (QuestStatus ~= QUEST_AVAILABLE) then
                player:startEvent(0x0067);
            elseif (QuestStatus == QUEST_AVAILABLE) then
                player:startEvent(0x0065);
            end
        else
            player:startEvent(0x0064);
        end
    else
        player:startEvent(0x006A);
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
    local QuestStatus = player:getQuestStatus(OTHER_AREAS, ORLANDO_S_ANTIQUES);
    local payout = player:getVar("ANTIQUE_PAYOUT");

    if (csid == 0x0065) then
        player:addQuest(OTHER_AREAS, ORLANDO_S_ANTIQUES);
    elseif (csid == 0x0066) then
        player:tradeComplete();
        player:addFame(WINDURST,WIN_FAME*10);
        player:addGil(payout);
        player:messageSpecial(GIL_OBTAINED,payout);
        player:completeQuest(OTHER_AREAS, ORLANDO_S_ANTIQUES);
        player:setVar("ANTIQUE_PAYOUT", 0);
        player:setLocalVar("OrlandoRepeat", 0);
    elseif (csid == 0x0067) then
        if (QuestStatus == QUEST_COMPLETED) then
            player:setLocalVar("OrlandoRepeat", 1);
        end
    end
end;
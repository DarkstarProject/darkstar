-----------------------------------
-- Area: Port Bastok
--   NPC: Kurando
--  Type: Quest Giver
-- @zone: 236
--  @pos -23.887 3.898 0.870
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_Bastok/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/titles");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(BASTOK,FEAR_OF_FLYING) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(4526,1) and trade:getItemCount() == 1) then
            player:startEvent(0x00AB); -- Quest Completion Dialogue
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local FearofFlying = player:getQuestStatus(BASTOK,FEAR_OF_FLYING);
    -- csid 0x00Ad ?
    if (FearofFlying == QUEST_AVAILABLE and    player:getFameLevel(BASTOK) >=3) then
        player:startEvent(0x00AA); -- Quest Start Dialogue
    elseif (FearofFlying == QUEST_COMPLETED) then
        player:startEvent(0x00AC); -- Dialogue after Completion
    else
        player:startEvent(0x001c); -- Default Dialogue
        
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

    if (csid == 0x00AA) then
        player:addQuest(BASTOK,FEAR_OF_FLYING);

    elseif (csid == 0x00AB) then
        if    (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13113);
        
        else
            player:tradeComplete();
            player:addItem(13113,1);
            player:messageSpecial(ITEM_OBTAINED,13113);
            player:setTitle(AIRSHIP_DENOUNCER);
            player:completeQuest(BASTOK,FEAR_OF_FLYING);
            player:addFame(BASTOK,30);
        end    
    end
end;
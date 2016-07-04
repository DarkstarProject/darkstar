-----------------------------------
-- Area: Norg
-- NPC:  Heizo
-- Starts and Ends Quest: Like Shining Leggings
-- @pos -1 -5 25 252
-----------------------------------
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Norg/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    ShiningLeggings = player:getQuestStatus(OUTLANDS,LIKE_A_SHINING_LEGGINGS);
    Legging = trade:getItemQty(14117);
    
    if (Legging > 0 and Legging == trade:getItemCount()) then
        TurnedInVar = player:getVar("shiningLeggings_nb");
        if (ShiningLeggings == QUEST_ACCEPTED and TurnedInVar + Legging >= 10) then -- complete quest
            player:startEvent(0x0081);
        elseif (ShiningLeggings == QUEST_ACCEPTED and TurnedInVar <= 9) then -- turning in less than the amount needed to finish the quest
            TotalLeggings = Legging + TurnedInVar
            player:tradeComplete();
            player:setVar("shiningLeggings_nb",TotalLeggings);
            player:startEvent(0x0080,TotalLeggings); -- Update player on number of leggings turned in
        end
    else
        if (ShiningLeggings == QUEST_ACCEPTED) then
            player:startEvent(0x0080,TotalLeggings); -- Update player on number of leggings turned in, but doesn't accept anything other than leggings
        else
            player:startEvent(0x007e); -- Give standard conversation if items are traded but no quest is accepted
        end
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    ShiningLeggings = player:getQuestStatus(OUTLANDS,LIKE_A_SHINING_LEGGINGS);
    
    if (ShiningLeggings == QUEST_AVAILABLE and  player:getFameLevel(NORG) >= 3) then
        player:startEvent(0x007f); -- Start Like Shining Leggings
    elseif (ShiningLeggings == QUEST_ACCEPTED) then
        player:startEvent(0x0080,player:getVar("shiningSubligar_nb")); -- Update player on number of Leggings turned in
    else
        player:startEvent(0x007e); -- Standard Conversation
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
    
    if (csid == 0x007f) then
        player:addQuest(OUTLANDS,LIKE_A_SHINING_LEGGINGS);
    elseif (csid == 0x0081) then
        player:tradeComplete();
        player:addItem(4958); -- Scroll of Dokumori: Ichi
        player:messageSpecial(ITEM_OBTAINED, 4958); -- Scroll of Dokumori: Ichi
        player:addFame(OUTLANDS,100);
        player:addTitle(LOOKS_GOOD_IN_LEGGINGS);
        player:setVar("shiningLeggings_nb",0);
        player:completeQuest(OUTLANDS,LIKE_A_SHINING_LEGGINGS);
    end
    
end;
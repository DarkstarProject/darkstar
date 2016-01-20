-----------------------------------
-- Area: Norg
-- NPC:  Heiji
-- Starts and Ends Quest: Like a Shining Subligar
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
    
    ShiningSubligar = player:getQuestStatus(OUTLANDS,LIKE_A_SHINING_SUBLIGAR);
    Subligar = trade:getItemQty(14242);
    
    if (Subligar > 0 and Subligar == trade:getItemCount()) then
        TurnedInVar = player:getVar("shiningSubligar_nb");
        if (ShiningSubligar == QUEST_ACCEPTED and TurnedInVar + Subligar >= 10) then -- complete quest
            player:startEvent(0x007d);
        elseif (ShiningSubligar == QUEST_ACCEPTED and TurnedInVar <= 9) then -- turning in less than the amount needed to finish the quest
            TotalSubligar = Subligar + TurnedInVar
            player:tradeComplete();
            player:setVar("shiningSubligar_nb",TotalSubligar);
            player:startEvent(0x007c,TotalSubligar); -- Update player on number of subligar turned in
        end
    else
        if (ShiningSubligar == QUEST_ACCEPTED) then
            player:startEvent(0x007c,TotalSubligar); -- Update player on number of subligar turned in, but doesn't accept anything other than subligar
        else
            player:startEvent(0x007a); -- Give standard conversation if items are traded but no quest is accepted
        end
    end
    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    ShiningSubligar = player:getQuestStatus(OUTLANDS,LIKE_A_SHINING_SUBLIGAR);
    
    if (ShiningSubligar == QUEST_AVAILABLE and player:getFameLevel(NORG) >= 3) then
        player:startEvent(0x007b); -- Start Like a Shining Subligar
    elseif (ShiningSubligar == QUEST_ACCEPTED) then
        player:startEvent(0x007c,player:getVar("shiningSubligar_nb")); -- Update player on number of subligar turned in
    else
        player:startEvent(0x007A); -- Standard Conversation
    end
    
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    
    if (csid == 0x007b) then
        player:addQuest(OUTLANDS,LIKE_A_SHINING_SUBLIGAR);
    elseif (csid == 0x007d) then
        player:tradeComplete();
        player:addTitle(LOOKS_SUBLIME_IN_A_SUBLIGAR);
        player:addItem(4955); -- Scroll of Kurayami: Ichi
        player:messageSpecial(ITEM_OBTAINED, 4955); -- Scroll of Kurayami: Ichi
        player:setVar("shiningSubligar_nb",0);
        player:addFame(OUTLANDS,NORG_FAME*100);
        player:completeQuest(OUTLANDS,LIKE_A_SHINING_SUBLIGAR);
    end
    
end;
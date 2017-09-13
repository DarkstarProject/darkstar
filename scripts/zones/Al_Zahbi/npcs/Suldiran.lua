-----------------------------------
-- Area: Al Zahbi
--  NPC: Suldiran
-- Type: NPC Quest
-- !pos 41.658 -6.999 -42.528 48
-----------------------------------
package.loaded["scripts/zones/Al_Zahbi/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Al_Zahbi/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/titles");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(AHT_URHGAN,FEAR_OF_THE_DARK_II) ~= QUEST_AVAILABLE) then
        if (trade:hasItemQty(2163,2) and trade:getItemCount() == 2) then
            player:startEvent(0x0010);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getQuestStatus(AHT_URHGAN,FEAR_OF_THE_DARK_II) == QUEST_AVAILABLE) then
        player:startEvent(0x000e);
    else
        player:startEvent(0x000f);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    if (csid == 0x000e and option == 1) then
        player:addQuest(AHT_URHGAN,FEAR_OF_THE_DARK_II);
    elseif (csid == 0x0010) then
        player:tradeComplete();
        player:addGil(GIL_RATE*200);
        player:addTitle(DARK_RESISTANT);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*200);
        if (player:getQuestStatus(AHT_URHGAN,FEAR_OF_THE_DARK_II) == QUEST_ACCEPTED) then
            player:completeQuest(AHT_URHGAN,FEAR_OF_THE_DARK_II);
        end
    end
end;

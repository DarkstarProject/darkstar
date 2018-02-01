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

function onTrade(player,npc,trade)
    if (player:getQuestStatus(AHT_URHGAN,FEAR_OF_THE_DARK_II) ~= QUEST_AVAILABLE) then
        if (trade:hasItemQty(2163,2) and trade:getItemCount() == 2) then
            player:startEvent(16);
        end
    end
end;

function onTrigger(player,npc)
    if (player:getQuestStatus(AHT_URHGAN,FEAR_OF_THE_DARK_II) == QUEST_AVAILABLE) then
        player:startEvent(14);
    else
        player:startEvent(15);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 14 and option == 1) then
        player:addQuest(AHT_URHGAN,FEAR_OF_THE_DARK_II);
    elseif (csid == 16) then
        player:tradeComplete();
        player:addGil(GIL_RATE*200);
        player:addTitle(DARK_RESISTANT);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*200);
        if (player:getQuestStatus(AHT_URHGAN,FEAR_OF_THE_DARK_II) == QUEST_ACCEPTED) then
            player:completeQuest(AHT_URHGAN,FEAR_OF_THE_DARK_II);
        end
    end
end;

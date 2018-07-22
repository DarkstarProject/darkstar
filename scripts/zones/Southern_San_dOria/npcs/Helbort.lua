-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Helbort
--  Starts and Finished Quest: A purchase of Arms
-- !pos 71 -1 65 230
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    quest_fas = player:getQuestStatus(SANDORIA,FATHER_AND_SON);      -- 1st Quest in Series
    quest_poa = player:getQuestStatus(SANDORIA,A_PURCHASE_OF_ARMS);  -- 2nd Quest in Series

    if (player:getFameLevel(SANDORIA) >= 2 and quest_fas == QUEST_COMPLETED and quest_poa == QUEST_AVAILABLE) then
        player:startEvent(594);  -- Start quest A Purchase of Arms
    elseif (quest_poa == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.WEAPONS_RECEIPT) == true) then
        player:startEvent(607); -- Finish A Purchase of Arms quest
    else
        player:startEvent(593);  -- Standard Dialog
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 594 and option == 0) then
        player:addQuest(SANDORIA, A_PURCHASE_OF_ARMS);
        player:addKeyItem(dsp.ki.WEAPONS_ORDER);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.WEAPONS_ORDER);
    elseif (csid == 607) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17090); -- Elm Staff
        else
            player:addTitle(dsp.title.ARMS_TRADER);
            player:delKeyItem(dsp.ki.WEAPONS_RECEIPT);
            player:addItem(17090);
            player:messageSpecial(ITEM_OBTAINED,17090); -- Elm Staff
            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA, A_PURCHASE_OF_ARMS);
        end
    end

end;
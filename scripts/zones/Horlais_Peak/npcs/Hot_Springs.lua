-----------------------------------
-- Area: Horlais Peak
--  NPC: Hot Springs
-- !pos 444 -37 -18 139
-----------------------------------
package.loaded["scripts/zones/Horlais_Peak/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/zones/Horlais_Peak/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(OUTLANDS,SECRET_OF_THE_DAMP_SCROLL) == QUEST_ACCEPTED and trade:hasItemQty(1210,1) and trade:getItemCount() == 1) then
        player:startEvent(2,1210);
    end
end;

function onTrigger(player,npc)
    if (player:getQuestStatus(SANDORIA,THE_GENERAL_S_SECRET) == 1) and (player:hasKeyItem(dsp.ki.CURILLAS_BOTTLE_EMPTY) == true) then
        player:addKeyItem(dsp.ki.CURILLAS_BOTTLE_FULL)
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.CURILLAS_BOTTLE_FULL);
        player:delKeyItem(dsp.ki.CURILLAS_BOTTLE_EMPTY);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 2) then
        player:tradeComplete();
        player:addItem(4949); -- Scroll of Jubaku: Ichi
        player:messageSpecial(ITEM_OBTAINED, 4949);
        player:addFame(NORG,75);
        player:addTitle(dsp.title.CRACKER_OF_THE_SECRET_CODE);
        player:completeQuest(OUTLANDS,SECRET_OF_THE_DAMP_SCROLL);
    end
end;
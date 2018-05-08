-----------------------------------
-- Area: Konschtat Highlands
--  NPC: qm1 (???)
-- Continues Quests: Past Perfect
-- !pos -201 16 80 108
-----------------------------------
package.loaded["scripts/zones/Konschtat_Highlands/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Konschtat_Highlands/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getQuestStatus(BASTOK,PAST_PERFECT) == QUEST_ACCEPTED) then
        player:addKeyItem(dsp.ki.TATTERED_MISSION_ORDERS);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.TATTERED_MISSION_ORDERS);
    else
        player:messageSpecial(FIND_NOTHING);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

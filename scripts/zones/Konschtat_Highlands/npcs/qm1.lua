-----------------------------------
-- Area: Konschtat Highlands
--  NPC: qm1 (???)
-- Continues Quests: Past Perfect
-- !pos -201 16 80 108
-----------------------------------
package.loaded["scripts/zones/Konschtat_Highlands/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Konschtat_Highlands/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local PastPerfect = player:getQuestStatus(BASTOK,PAST_PERFECT);

    if (PastPerfect == QUEST_ACCEPTED) then
        player:addKeyItem(0x6d);
        player:messageSpecial(KEYITEM_OBTAINED,0x6d); -- Tattered Mission Orders
    else
        player:messageSpecial(FIND_NOTHING);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
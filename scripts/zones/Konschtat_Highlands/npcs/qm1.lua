-----------------------------------
-- Area: Konschtat Highlands
--  NPC: qm1 (???)
-- Continues Quests: Past Perfect
-- @pos -201 16 80 108
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
local text = require("scripts/zones/Konschtat_Highlands/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local PastPerfect = player:getQuestStatus(BASTOK,PAST_PERFECT);

    if (PastPerfect == QUEST_ACCEPTED) then
        player:addKeyItem(0x6d);
        player:messageSpecial(text.KEYITEM_OBTAINED,0x6d); -- Tattered Mission Orders
    else
        player:messageSpecial(text.FIND_NOTHING);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
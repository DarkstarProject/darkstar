-----------------------------------
-- Area: West Ronfaure
--  NPC: qm1 (???)
--  Involved in Quest: The Dismayed Customer
-- !pos -453 -20 -230 100
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
local ID = require("scripts/zones/West_Ronfaure/IDs");
-----------------------------------

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)

    if (player:getQuestStatus(SANDORIA, dsp.quest.id.sandoria.THE_DISMAYED_CUSTOMER) == QUEST_ACCEPTED and player:getVar("theDismayedCustomer") == 1) then
        player:addKeyItem(dsp.ki.GULEMONTS_DOCUMENT);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.GULEMONTS_DOCUMENT);
        player:setVar("theDismayedCustomer", 0);
    else
        player:messageSpecial(ID.text.DISMAYED_CUSTOMER);
    end;

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

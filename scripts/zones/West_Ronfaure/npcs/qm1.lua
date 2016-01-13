-----------------------------------
-- Area: West Ronfaure
--  NPC: qm1 (???)
-- Involved in Quest: The Dismayed Customer
-- @pos -453 -20 -230 100
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
local text = require("scripts/zones/West_Ronfaure/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getQuestStatus(SANDORIA, THE_DISMAYED_CUSTOMER) == QUEST_ACCEPTED and player:getVar("theDismayedCustomer") == 1) then
        player:addKeyItem(GULEMONTS_DOCUMENT);
        player:messageSpecial(text.KEYITEM_OBTAINED, GULEMONTS_DOCUMENT);
        player:setVar("theDismayedCustomer", 0);
    else
        player:messageSpecial(text.DISMAYED_CUSTOMER);
    end;
    
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
end;


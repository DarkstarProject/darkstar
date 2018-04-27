-----------------------------------
-- Area: West Ronfaure
--  NPC: qm1 (???)
--  Involved in Quest: The Dismayed Customer
-- !pos -453 -20 -230 100
-----------------------------------
package.loaded["scripts/zones/West_Ronfaure/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/West_Ronfaure/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)

    if (player:getQuestStatus(SANDORIA, THE_DISMAYED_CUSTOMER) == QUEST_ACCEPTED and player:getVar("theDismayedCustomer") == 1) then
        player:addKeyItem(dsp.kis.GULEMONTS_DOCUMENT);
        player:messageSpecial(KEYITEM_OBTAINED, dsp.kis.GULEMONTS_DOCUMENT);
        player:setVar("theDismayedCustomer", 0);
    else
        player:messageSpecial(DISMAYED_CUSTOMER);
    end;

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;



-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Baunise
-- Involved in Quest: A Knight's Test
-- @zone 230
-- !pos -55 -8 -32
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Southern_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:hasKeyItem(BOOK_OF_TASKS) and player:hasKeyItem(BOOK_OF_THE_WEST) == false) then
        player:startEvent(634);
    else
        player:showText(npc, 7817)-- nothing to report
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 634) then
        player:addKeyItem(BOOK_OF_THE_WEST);
        player:messageSpecial(KEYITEM_OBTAINED, BOOK_OF_THE_WEST);
    end

end;
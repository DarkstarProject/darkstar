-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Baunise
-- Involved in Quest: A Knight's Test
-- !pos -55 -8 -32 230
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
    if (player:hasKeyItem(dsp.ki.BOOK_OF_TASKS) and player:hasKeyItem(dsp.ki.BOOK_OF_THE_WEST) == false) then
        player:startEvent(634);
    else
        player:showText(npc, 7817)-- nothing to report
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 634) then
        player:addKeyItem(dsp.ki.BOOK_OF_THE_WEST);
        player:messageSpecial(KEYITEM_OBTAINED, dsp.ki.BOOK_OF_THE_WEST);
    end

end;
-----------------------------------
-- Area: Castle Oztroja
--  NPC: _m70 (Torch Stand)
-- Involved in Mission: Magicite
-- !pos -97.134 24.250 -105.979 151
-----------------------------------
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/zones/Castle_Oztroja/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(YAGUDO_TORCH)) then
        player:startEvent(11);
    else
        player:messageSpecial(PROBABLY_WORKS_WITH_SOMETHING_ELSE);
    end

    return 1;

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
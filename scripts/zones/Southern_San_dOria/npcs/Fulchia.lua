-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Fulchia
--  General Info NPC
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Southern_San_dOria/TextIDs");

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)
    player:startEvent(587);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Pulloie
-- Quest NPC
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)
    if (player:getNation() == 0) then
    player:startEvent(595);
else
    player:startEvent(598);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- Area: King_Ranperre's Tomb
--  NPC: Strange Apparatus
-- !pos -260 7 -142 190
-----------------------------------
package.loaded["scripts/zones/King_Ranperres_Tomb/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/King_Ranperres_Tomb/TextIDs");
require("scripts/globals/strangeapparatus");
-----------------------------------

function onTrade(player,npc,trade)
    player:startEvent(13, 0, 0, INFINITY_CORE, 0, 0, 0, 0, player:getZoneID());
end;

function onTrigger(player,npc)
    player:startEvent(11, 0, 0, INFINITY_CORE, 0, 0, 0, 0, player:getZoneID());
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
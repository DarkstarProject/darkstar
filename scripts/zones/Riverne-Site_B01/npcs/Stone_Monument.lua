-----------------------------------
-- Area: Riverne Site #B01
--  NPC: Stone Monument
-----------------------------------
package.loaded["scripts/zones/Riverne-Site_B01/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Riverne-Site_B01/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:messageSpecial(MONUMENT);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
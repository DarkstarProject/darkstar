-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Auction Counter
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:sendMenu(3);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

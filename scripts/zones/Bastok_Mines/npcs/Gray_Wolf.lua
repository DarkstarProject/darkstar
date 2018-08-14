-----------------------------------
-- Area: Bastok Mines
--  NPC: Gray Wolf
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(19);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
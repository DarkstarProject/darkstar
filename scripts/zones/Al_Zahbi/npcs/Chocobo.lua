-----------------------------------
-- Area: Al Zahbi
--  NPC: Chocobo
-----------------------------------
package.loaded["scripts/zones/Al_Zahbi/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Al_Zahbi/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    npc:showText(npc, CHOCOBO_HAPPY);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;


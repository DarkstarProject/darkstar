-----------------------------------
-- Area: Oldton Movalpolos
--  NPC: Rakorok
-----------------------------------
package.loaded["scripts/zones/Oldton_Movalpolos/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Oldton_Movalpolos/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    npc:showText(npc, RAKOROK_DIALOGUE);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;


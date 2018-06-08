-----------------------------------
-- Area: Pashhow Marshlands
--  NPC: Luck Rune
--  Involved in Quest: Mhaura Fortune
-- !pos 573.245 24.999 199.560 109
-----------------------------------
package.loaded["scripts/zones/Pashhow_Marshlands/TextIDs"] = nil;
-------------------------------------
require("scripts/zones/Pashhow_Marshlands/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_THE_ORDINARY);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
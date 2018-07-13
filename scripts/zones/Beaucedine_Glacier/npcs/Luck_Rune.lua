-----------------------------------
-- Area: Beaucedine Glacier
--  NPC: Luck Rune
--  Involved in Quest: Mhaura Fortune
-- !pos 70.736 -37.778 149.624 111
-----------------------------------
package.loaded["scripts/zones/Beaucedine_Glacier/TextIDs"] = nil;
-------------------------------------
require("scripts/zones/Beaucedine_Glacier/TextIDs");
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
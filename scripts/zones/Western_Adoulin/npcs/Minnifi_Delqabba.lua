-----------------------------------
-- Area: Western Adoulin
--  NPC: Minnifi Delqabba
-- Type: Shop NPC
--  @zone 256
--  !pos 77 4 -125 256
-----------------------------------
package.loaded["scripts/zones/Western_Adoulin/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Western_Adoulin/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- Standard dialogue
    player:showText(npc, MINNIFI_DIALOGUE);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

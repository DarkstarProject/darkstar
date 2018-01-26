-----------------------------------
-- Area: Rolanberry Fields
--  NPC: Signpost
-----------------------------------
require("scripts/globals/settings");
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(SIGN);
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,menuchoice)
end;

function onEventFinish(player,csid,option)
end;

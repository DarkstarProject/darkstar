-----------------------------------
-- Area: Zeruhn Mines
--  NPC: Grounds Tome
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/groundsofvalor");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    startGov(GOV_EVENT_ZERUHN_MINES,player);
end;

function onEventUpdate(player,csid,option)
    updateGov(player,csid,option,626,627,628,629,630,0,0,0,0,0);
end;

function onEventFinish(player,csid,option)
    finishGov(player,csid,option,626,627,628,629,630,0,0,0,0,0,GOV_MSG_ZERUHN_MINES);
end;

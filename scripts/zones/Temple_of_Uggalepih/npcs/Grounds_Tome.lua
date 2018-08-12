-----------------------------------
-- Area: Temple of Uggalepih
--  NPC: Grounds Tome
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/groundsofvalor");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    startGov(GOV_EVENT_TEMPLE_OF_UGGALEPIH,player);
end;

function onEventUpdate(player,csid,option)
    updateGov(player,csid,option,790,791,792,793,794,795,0,0,0,0);
end;

function onEventFinish(player,csid,option)
    finishGov(player,csid,option,790,791,792,793,794,795,0,0,0,0,GOV_MSG_TEMPLE_OF_UGGALEPIH);
end;

-----------------------------------
-- Area: Den of Rancor
--  NPC: Grounds Tome
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/groundsofvalor");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    startGov(GOV_EVENT_DEN_OF_RANCOR,player);
end;

function onEventUpdate(player,csid,option)
    updateGov(player,csid,option,796,797,798,799,800,801,802,803,0,0);
end;

function onEventFinish(player,csid,option)
    finishGov(player,csid,option,796,797,798,799,800,801,802,803,0,0,GOV_MSG_DEN_OF_RANCOR);
end;

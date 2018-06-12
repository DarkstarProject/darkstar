-----------------------------------
-- Area: Ifrit's Cauldron
--  NPC: Grounds Tome
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/groundsofvalor");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    startGov(GOV_EVENT_IFRITS_CAULDRON,player);
end;

function onEventUpdate(player,csid,option)
    updateGov(player,csid,option,755,756,757,758,759,760,761,762,0,0);
end;

function onEventFinish(player,csid,option)
    finishGov(player,csid,option,755,756,757,758,759,760,761,762,0,0,GOV_MSG_IFRITS_CAULDRON);
end;

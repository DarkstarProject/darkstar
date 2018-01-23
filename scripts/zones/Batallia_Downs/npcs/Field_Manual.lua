-----------------------------------
-- Field Manual
-- Area: Batallia Downs
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onTrigger(player,npc)
    startFov(FOV_EVENT_BATALLIA,player);
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,menuchoice)
    updateFov(player,csid,menuchoice,15,72,73,74,75);
end;

function onEventFinish(player,csid,option)
    finishFov(player,csid,option,15,72,73,74,75,FOV_MSG_BATALLIA);
end;

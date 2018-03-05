-----------------------------------
-- Area: Qufim Island
-- Field Manual
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onTrigger(player,npc)
    startFov(FOV_EVENT_QUFIM,player);
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,menuchoice)
    updateFov(player,csid,menuchoice,41,42,43,44,45);
end;

function onEventFinish(player,csid,option)
    finishFov(player,csid,option,41,42,43,44,45,FOV_MSG_QUFIM);
end;

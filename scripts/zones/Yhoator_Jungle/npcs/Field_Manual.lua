-----------------------------------
-- Field Manual
-- Area: Yhoator Jungle
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onTrigger(player,npc)
    startFov(FOV_EVENT_YHOATOR,player);
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,menuchoice)
    updateFov(player,csid,menuchoice,129,130,131,132,133);
end;

function onEventFinish(player,csid,option)
    finishFov(player,csid,option,129,130,131,132,133,FOV_MSG_YHOATOR);
end;

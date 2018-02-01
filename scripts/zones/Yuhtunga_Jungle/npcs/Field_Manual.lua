-----------------------------------
-- Field Manual
-- Area: Yuhtunga Jungle
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onTrigger(player,npc)
    startFov(FOV_EVENT_YUHTUNGA,player);
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,menuchoice)
    updateFov(player,csid,menuchoice,124,125,126,127,128);
end;

function onEventFinish(player,csid,option)
    finishFov(player,csid,option,124,125,126,127,128,FOV_MSG_YUHTUNGA);
end;

-----------------------------------
-- Area: Valley of Sorrows
-- Field Manual
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onTrigger(player,npc)
    startFov(FOV_EVENT_SORROWS,player);
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,menuchoice)
    updateFov(player,csid,menuchoice,139,140,141,0,0);
end;

function onEventFinish(player,csid,option)
    finishFov(player,csid,option,139,140,141,0,0,FOV_EVENT_SORROWS);
end;

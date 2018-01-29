-----------------------------------
-- Field Manual
-- Area: Behemoth's Dominion
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onTrigger(player,npc)
    startFov(FOV_EVENT_BEHEMOTH,player);
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,menuchoice)
    updateFov(player,csid,menuchoice,101,102,103,0,0);
end;

function onEventFinish(player,csid,option)
    finishFov(player,csid,option,101,102,103,0,0,FOV_MSG_BEHEMOTH);
end;

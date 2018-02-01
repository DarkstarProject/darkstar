-----------------------------------
-- Field Manual
-- Area: Eastern Altepa Desert
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onTrigger(player,npc)
    startFov(FOV_EVENT_EAST_ALTEPA,player);
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,menuchoice)
    updateFov(player,csid,menuchoice,109,110,111,112,113);
end;

function onEventFinish(player,csid,option)
    finishFov(player,csid,option,109,110,111,112,113,FOV_MSG_EAST_ALTEPA);
end;

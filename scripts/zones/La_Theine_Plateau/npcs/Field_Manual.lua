-----------------------------------
-- Field Manual
-- Area: La Theine Plateau
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onTrigger(player,npc)
    startFov(FOV_EVENT_LA_THEINE,player);
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,menuchoice)
    updateFov(player,csid,menuchoice,5,6,69,70,71);
end;

function onEventFinish(player,csid,option)
    finishFov(player,csid,option,5,6,69,70,71,FOV_MSG_LA_THEINE);
end;

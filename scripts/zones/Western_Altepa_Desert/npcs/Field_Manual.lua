-----------------------------------
-- Field Manual
-- Area: Western Altepa Desert
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onTrigger(player,npc)
    startFov(FOV_EVENT_WEST_ALTEPA,player);
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,menuchoice)
    updateFov(player,csid,menuchoice,134,135,136,137,138);
end;

function onEventFinish(player,csid,option)
    finishFov(player,csid,option,134,135,136,137,138,FOV_MSG_WEST_ALTEPA);
end;

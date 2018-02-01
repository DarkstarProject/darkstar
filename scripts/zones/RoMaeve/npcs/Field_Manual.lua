-----------------------------------
-- Field Manual
-- Area: Ro'Maeve
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onTrigger(player,npc)
    startFov(FOV_EVENT_ROMAEVE,player);
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,menuchoice)
    updateFov(player,csid,menuchoice,119,120,121,122,123);
end;

function onEventFinish(player,csid,option)
    finishFov(player,csid,option,119,120,121,122,123,FOV_MSG_ROMAEVE);
end;

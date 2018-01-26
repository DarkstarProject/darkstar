-----------------------------------
-- Field Manual
-- Area: RuAun Gardens
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onTrigger(player,npc)
    startFov(FOV_EVENT_RUAUN_GARDENS,player);
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,menuchoice)
    updateFov(player,csid,menuchoice,142,143,144,145,146);
end;

function onEventFinish(player,csid,option)
    finishFov(player,csid,option,142,143,144,145,146,FOV_MSG_RUAUN_GARDENS);
end;

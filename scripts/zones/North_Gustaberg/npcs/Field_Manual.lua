-----------------------------------
-- Area: North Gustaberg
--  NPC: Field Manual
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onTrigger(player,npc)
    startFov(FOV_EVENT_NORTH_GUSTABERG,player);
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,menuchoice)
    updateFov(player,csid,menuchoice,16,17,18,19,59);
end;

function onEventFinish(player,csid,option)
    finishFov(player,csid,option,16,17,18,19,59,FOV_MSG_NORTH_GUSTABERG);
end;

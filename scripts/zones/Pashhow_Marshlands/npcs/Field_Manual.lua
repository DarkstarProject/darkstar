-----------------------------------
-- Area: Pashhow Marshlands
--  NPC: Field Manual
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onTrigger(player,npc)
    startFov(FOV_EVENT_PASHHOW,player);
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,menuchoice)
    updateFov(player,csid,menuchoice,21,22,23,24,60);
end;

function onEventFinish(player,csid,option)
    finishFov(player,csid,option,21,22,23,24,60,FOV_MSG_PASHHOW);
end;

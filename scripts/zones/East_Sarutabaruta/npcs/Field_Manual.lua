-----------------------------------
-- Area: East Sarutabaruta
--  NPC: Field Manual
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onTrigger(player,npc)
    startFov(FOV_EVENT_EAST_SARUTA,player);
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,menuchoice)
    updateFov(player,csid,menuchoice,89,90,91,92,93);
end;

function onEventFinish(player,csid,option)
    finishFov(player,csid,option,89,90,91,92,93,FOV_MSG_EAST_SARUTA);
end;

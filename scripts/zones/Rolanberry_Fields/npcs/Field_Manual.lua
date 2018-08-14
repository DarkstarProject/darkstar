-----------------------------------
-- Area: Rolanberry Fields
--  NPC: Field Manual
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onTrigger(player,npc)
    startFov(FOV_EVENT_ROLANBERRY,player);
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,menuchoice)
    updateFov(player,csid,menuchoice,25,85,86,87,88);
end;

function onEventFinish(player,csid,option)
    finishFov(player,csid,option,25,85,86,87,88,FOV_MSG_ROLANBERRY);
end;

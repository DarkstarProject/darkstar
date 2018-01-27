-----------------------------------
-- Area: West Ronfaure
--  NPC: Field Manual
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onTrigger(player,npc)
    startFov(FOV_EVENT_WEST_RONFAURE,player);
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,menuchoice)
    updateFov(player,csid,menuchoice,1,2,3,4,56);
end;

function onEventFinish(player,csid,option)
    finishFov(player,csid,option,1,2,3,4,56,FOV_MSG_WEST_RONFAURE);
end;

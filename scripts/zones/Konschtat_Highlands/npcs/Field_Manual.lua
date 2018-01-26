-----------------------------------
-- Area: Konschtat Highlands
-- Field Manual
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onTrigger(player,npc)
    startFov(FOV_EVENT_KONSCHTAT,player);
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,menuchoice)
    updateFov(player,csid,menuchoice,20,81,82,83,84);
end;

function onEventFinish(player,csid,option)
    finishFov(player,csid,option,20,81,82,83,84,FOV_MSG_KONSCHTAT);
end;

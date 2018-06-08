-----------------------------------
-- Area: Meriphataud Mountains
--  NPC: Field Manual
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onTrigger(player,npc)
    startFov(FOV_EVENT_MERIPH,player);
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,menuchoice)
    updateFov(player,csid,menuchoice,36,37,38,39,63);
end;

function onEventFinish(player,csid,option)
    finishFov(player,csid,option,36,37,38,39,63,FOV_MSG_MERIPH);
end;

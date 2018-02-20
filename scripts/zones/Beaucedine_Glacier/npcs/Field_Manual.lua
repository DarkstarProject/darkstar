-----------------------------------
-- Area: Beaucedine Glacier
--  NPC: Field Manual
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onTrigger(player,npc)
    startFov(FOV_EVENT_BEAUCEDINE,player);
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,menuchoice)
    updateFov(player,csid,menuchoice,46,47,48,49,50);
end;

function onEventFinish(player,csid,option)
    finishFov(player,csid,option,46,47,48,49,50,FOV_MSG_BEAUCEDINE);
end;

-----------------------------------
-- Area: Xarcabard
--  NPC: Field Manual
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onTrigger(player,npc)
    startFov(FOV_EVENT_XARCABARD,player);
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,menuchoice)
    updateFov(player,csid,menuchoice,51,52,53,54,55);
end;

function onEventFinish(player,csid,option)
    finishFov(player,csid,option,51,52,53,54,55,FOV_MSG_XARCABARD);
end;

-----------------------------------    
-- Field Manual    
-- Area: Buburimu Peninsula
-----------------------------------    
    
require("scripts/globals/settings");    
require("scripts/globals/fieldsofvalor");    
    
-----------------------------------    
-- onTrigger Action    
-----------------------------------    
    
function onTrigger(player,npc)    
    startFov(FOV_EVENT_BUBURIMU,player);
end;    
    
-----------------------------------    
-- onTrade Action    
-----------------------------------    
    
function onTrade(player,npc,trade)    
end;    
    
-----------------------------------    
-- onEventSelection    
-----------------------------------    
    
function onEventUpdate(player,csid,menuchoice)    
    updateFov(player,csid,menuchoice,32,33,34,35,62);
end;    
    
-----------------------------------    
-- onEventFinish Action    
-----------------------------------    
    
function onEventFinish(player,csid,option)    
    finishFov(player,csid,option,32,33,34,35,62,FOV_MSG_BUBURIMU);
end;    

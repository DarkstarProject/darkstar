-----------------------------------	
-- Field Manual	
-- Area: Eastern Altepa Desert
-----------------------------------	
	
require("scripts/globals/settings");	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onTrigger Action	
-----------------------------------	
	
function onTrigger(player,npc)	
	startFov(FOV_EVENT_EAST_ALTEPA,player);
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
	updateFov(player,csid,menuchoice,109,110,111,112,113);
end;	
	
-----------------------------------	
-- onEventFinish Action	
-----------------------------------	
	
function onEventFinish(player,csid,option)	
	finishFov(player,csid,option,109,110,111,112,113,FOV_MSG_EAST_ALTEPA);
end;	

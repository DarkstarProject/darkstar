-----------------------------------	
-- Area: Jugner Forest	
-- NPC: Field Manual	
-----------------------------------	
	
require("scripts/globals/settings");	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onTrigger Action	
-----------------------------------	
	
function onTrigger(player,npc)	
	startFov(FOV_EVENT_JUGNER,player);
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
	updateFov(player,csid,menuchoice,11,12,13,14,58);
end;	
	
-----------------------------------	
-- onEventFinish Action	
-----------------------------------	
	
function onEventFinish(player,csid,option)	
	finishFov(player,csid,option,11,12,13,14,58,FOV_MSG_JUGNER);
end;	

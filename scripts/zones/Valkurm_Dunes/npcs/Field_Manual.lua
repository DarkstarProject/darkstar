-----------------------------------
--	Author: Kegsay
-- 	Field Manual
-- 	Working, 100%.
-- The differences between Field Manuals in other zones are Event ID, Regime IDs (5x) only. 
-----------------------------------
-- Includes
require("/scripts/globals/settings");
require("/scripts/globals/fieldsofvalor");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
	startFov(FOV_EVENT_VALKURM,player);
 end;
 
function onTrade(player,npc,trade)
 end; 
 
--------------------------------------
-- onEventSelection
--------------------------------------
function onEventUpdate(player,csid,menuchoice)
	updateFov(player,csid,menuchoice,7,8,9,10,57); --the 5 regime IDs corresponding to the 5 pages in this area
end;
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	finishFov(player,csid,option,7,8,9,10,57,FOV_MSG_VALKURM); --5 reg ids and the msg offset
end;
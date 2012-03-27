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
	startFov(FOV_EVENT_RUAUN_GARDENS,player);
 end;
 
function onTrade(player,npc,trade)
 end; 
 
--------------------------------------
-- onEventSelection
--------------------------------------
function onEventUpdate(player,csid,menuchoice)
	updateFov(player,csid,menuchoice,142,143,144,145,146); --the 5 regime IDs corresponding to the 5 pages in this area
end;
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	finishFov(player,csid,option,142,143,144,145,146,FOV_MSG_RUAUN_GARDENS); --5 reg ids and the msg offset
end;
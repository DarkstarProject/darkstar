-----------------------------------
--	Author: Kegsay
-- 	Field Manual
-- 	Working, 100%.
-- The differences between Field Manuals in other zones are Event ID, Regime IDs (5x) only. 
-----------------------------------
-- Includes
require("/scripts/globals/settings");
require("/scripts/globals/fieldsofvalor");
package.loaded["/scripts/globals/fieldsofvalor"]=nil;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
	startFov(FOV_EVENT_BATALLIA,player);
 end;
 
function onTrade(player,npc,trade)
 end; 
 
--------------------------------------
-- onEventSelection
--------------------------------------
function onEventUpdate(player,csid,menuchoice)
	updateFov(player,csid,menuchoice,15,72,73,74,75); --the 5 regime IDs corresponding to the 5 pages in this area
end;
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	finishFov(player,csid,option,15,72,73,74,75,FOV_MSG_BATALLIA); --5 reg ids and the msg offset
end;
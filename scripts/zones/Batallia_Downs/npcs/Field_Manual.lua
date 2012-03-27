-----------------------------------
--	Author: Kegsay
-- 	Field Manual
-- 	Working, 100%.
--  The differences between Field Manuals in other zones are Event ID, Regime IDs (5x) only. 
-----------------------------------

require("/scripts/globals/fieldsofvalor");

-----------------------------------
-- 15  Flies/Bas
-- 72  Saplings/Flies
-- 73  Saplings/Bas
-- 74  Tigers/Goblins/Orcs
-- 75  Tigers
-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	startFov(FOV_EVENT_BATALLIA,player);
end;

--------------------------------------
-- onEventSelection
--------------------------------------

function onEventUpdate(player,csid,option)
	updateFov(player,csid,option,15,72,73,74,75);
end;
 
-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
	finishFov(player,csid,option,15,72,73,74,75,FOV_MSG_BATALLIA);
end;
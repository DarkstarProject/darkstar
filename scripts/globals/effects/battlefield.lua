-----------------------------------
--
-- 	EFFECT_BATTLEFIELD
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)

	fieldEffect = effect:getPower();
	pZone = target:getZone();
		
	if(fieldEffect == 1 and target:getVar("BCNM_Killed") < 3) then -- San d'Oria Mission 1-3
		target:setAnimation(0);
		target:startEvent(0x7d02);
		bcnmDespawn(target:getVar(tostring(pZone) .. "_Field"),fieldEffect,pZone);
	elseif(fieldEffect == 2 and target:getVar("BCNM_Killed") == 0) then -- DRG Flag quest
		target:setAnimation(0);
		target:startEvent(0x7d02);
		bcnmDespawn(target:getVar(tostring(pZone) .. "_Field"),fieldEffect,pZone); -- Nation Mission 2-3
	elseif(fieldEffect == 100 and target:getVar("BCNM_Killed") < 2 and target:getVar(tostring(pZone) .. "_Runaway") == 0) then
		target:setAnimation(0);
		target:startEvent(0x7d02);
		player:levelRestriction(0);
		bcnmDespawn(target:getVar(tostring(pZone) .. "Field"),fieldEffect,pZone);
	end
	
	target:setVar("BCNM_Timer",0);
	target:setVar("BCNM_Killed",0);
	target:setVar(tostring(pZone) .. "_Ready",0);
	target:setVar(tostring(pZone) .. "_Field",0);
	target:setVar(tostring(pZone) .. "_Fight",0);
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);
end;
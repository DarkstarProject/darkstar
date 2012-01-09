-----------------------------------
--
--  EFFECT_HEALING
--	
--	Activated through the /heal command
-----------------------------------
 
require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:setAnimation(33);
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	
	healtime = effect:getTickCount();

	if (healtime > 1) then
		if (not(target:hasStatusEffect(EEFFECT_DISEASE))) then
			if (target:hasStatusEffect(EFFECT_SIGNET)) then 
				target:addHP(10+(3*math.floor(target:getMainLvl()/10))+(healtime-2+(1+math.floor(target:getMaxHP()/300)))+(target:getMod(MOD_HPHEAL)));
			else
				target:setTP(target:getTP()-10);
				target:addHP(10+(healtime-2)+(target:getMod(MOD_HPHEAL)));
			end
			target:addMP(12+(healtime-2)+(target:getMod(MOD_MPHEAL))+(target:getMod(MOD_CLEAR_MIND)*(healtime-2)));
		end
	end

end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	target:setAnimation(0);
	target:delStatusEffect(EFFECT_LEAVEGAME);
end;
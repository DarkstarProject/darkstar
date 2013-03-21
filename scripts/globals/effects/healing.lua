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

	local healtime = effect:getTickCount();

	if (healtime > 1) then
		-- curse II also known as "zombie"
		if (not(target:hasStatusEffect(EFFECT_DISEASE)) and target:hasStatusEffect(EFFECT_PLAGUE) == false and target:hasStatusEffect(EFFECT_CURSE_II) == false) then
			if (target:getContinentID() == 1 and target:hasStatusEffect(EFFECT_SIGNET)) then
				target:addHP(10+(3*math.floor(target:getMainLvl()/10))+(healtime-2)*(1+math.floor(target:getMaxHP()/300))+(target:getMod(MOD_HPHEAL)));
			else
				target:setTP(target:getTP()-10);
				target:addHP(10+(healtime-2)+(target:getMod(MOD_HPHEAL)));
			end
         -- Each rank of Clear Mind provides +3 hMP (via MOD_MPHEAL)
         -- Each tic of healing should be +1mp more than the last
         -- Clear Mind III increases this to +2, and Clear Mind V to +3 (via MOD_CLEAR_MIND)
			target:addMP(12+((healtime-2) * (1+target:getMod(MOD_CLEAR_MIND)))+(target:getMod(MOD_MPHEAL)));
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
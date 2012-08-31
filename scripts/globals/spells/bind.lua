-----------------------------------------
-- Spell: Bind
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	
	--Pull base stats.
	dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
	bonus = AffinityBonus(caster,spell);
	
	--Duration, including resistance.  May need more research.
	duration = math.random(5,60);
	
	--Resist
	resist = applyResistance(caster,spell,target,dINT,35,bonus);
	
	if(100 * math.random() >= target:getMod(MOD_BINDRES)) then
		if(resist >= 0.5) then --Do it!
			--Try to erase a weaker bind.
			bind = target:getStatusEffect(EFFECT_BIND)
			if(bind ~= nil) then
				if(bind:getPower() < 1) then
					target:delStatusEffect(EFFECT_BIND);	
					target:addStatusEffect(EFFECT_BIND,power,0,duration);
--					if(spell:isAOE() == false) then
						spell:setMsg(237);
--					else
--						spell:setMsg(267);
--					end
				else
					spell:setMsg(75);
				end
			else
				target:addStatusEffect(EFFECT_BIND,target:speed(),0,duration);
--				if(spell:isAOE() == false) then
					spell:setMsg(237);
--				else
--					spell:setMsg(267);
--				end
			end
		else
--			if(spell:isAOE() == false) then
				spell:setMsg(85);
--			else
--				spell:setMsg(284);
--			end
		end
	else
--		if(spell:isAOE() == false) then
			spell:setMsg(85);
--		else
--			spell:setMsg(284);
--		end
	end
	
	target:updateEnmity(caster,320,1);
	
	return EFFECT_BIND;

end;
-----------------------------------------
-- Spell: Refueling
-- Overwrites Intimidate (Pugil), Sticky Thread (Crawler), and Horror Cloud (Skeleton)
-- Cannot be overwriten by Intimidate or Horror Cloud
-- Overwriten by, and cannot overwrite, Slow, Slowga, Haste, Hastega, and Spider Web
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	local slow = target:getStatusEffect(EFFECT_SLOW);
	local haste = target:getStatusEffect(EFFECT_HASTE);
	if(haste == nil and slow == nil) then
		target:addStatusEffect(EFFECT_HASTE,10,0,300);
	else
		spell:setMsg(75);
	end
end;

-----------------------------------------
-- Spell: Aquaveil
-- Reduces chance of having a spell interrupted.
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	
	if(target:getStatusEffect(EFFECT_AQUAVEIL) ~= nil) then
		target:delStatusEffect(EFFECT_AQUAVEIL);
	end
		
	-- duration is said to be based on enhancing skill with max 5 minutes, but I could find no
	-- tests that quantify the relationship so I'm using 5 minutes for now.
		
	duration = 300;
	
	if(caster:getStatusEffect(EFFECT_COMPOSURE) ~= nil) and (caster == target) then
		duration = duration * 3;
	end;
		
	target:addStatusEffect(EFFECT_AQUAVEIL,AQUAVEIL_INTERR_RATE,0,duration,FLAG_DISPELABLE);
	--Adjust message for multiple targets.
--	if(spell:isAOE() == false) then
		spell:setMsg(230);
--	else
--		spell:setMsg(266);
--	end
		
	--target:updateEnmity(caster,300,1);
	
	return EFFECT_AQUAVEIL;
	
end;
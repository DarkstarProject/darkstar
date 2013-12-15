---------------------------------------------------
-- Self-Destruct
---------------------------------------------------
require("/scripts/globals/settings");
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

	local duration = 300;
	local playerHP = caster:getHP();
	local damage = caster:getHP() -1;

	
	if(damage > 0) then
		target:delHP(playerHP);
		caster:setHP(1);
		caster:delStatusEffect(EFFECT_WEAKNESS);
		caster:addStatusEffect(EFFECT_WEAKNESS,1,0,duration);
		
	end
	return damage;
end;
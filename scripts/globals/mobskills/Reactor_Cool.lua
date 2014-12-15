---------------------------------------------
-- Reactor Cool
-- Gives Undispellable Ice Spikes and Defense Boost
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_ICE_SPIKES;
	local typeEffect2 = EFFECT_DEFENSE_BOOST;
    local randy = math.random(15,30);
	
    skill:setMsg(MobBuffMove(mob, typeEffect, randy, 0, 60));
	mob:GetStatusEffect(mob);
	effect:unsetFlag(EFFECTFLAG_DISPELABLE) 
	skill:setMsg(MobBuffMove(mob, typeEffect2, 26, 0, 60));
	mob:GetStatusEffect(mob);
	effect:unsetFlag(EFFECTFLAG_DISPELABLE) 


	return typeEffect;
end;

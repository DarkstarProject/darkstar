---------------------------------------------
--  Enervation
--
--  Description: Lowers the defense and magical defense of enemies within range.
--  Type: Magical (Dark)
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_DEFENSE_DOWN;

    local silenced = false;
    local blinded = false;

    silenced = MobStatusEffectMove(mob, target, EFFECT_DEFENSE_DOWN, 20, 0, 120);

    blinded = MobStatusEffectMove(mob, target, EFFECT_MAGIC_DEF_DOWN, 20, 0, 120);

    skill:setMsg(MSG_ENFEEB_IS);

    -- display silenced first, else blind
    if(silenced == MSG_ENFEEB_IS) then
        typeEffect = EFFECT_SILENCE;
    elseif(blinded == MSG_ENFEEB_IS) then
        typeEffect = EFFECT_BLINDNESS;
    else
        skill:setMsg(MSG_MISS);
    end

	return typeEffect;
end;

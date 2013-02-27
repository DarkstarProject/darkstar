---------------------------------------------
--  Thornsong
--
--  Description: Covers the user in fiery spikes. Enemies that hit it take fire damage.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes:
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    -- can only use if not silenced
    if(mob:hasStatusEffect(EFFECT_SILENCE) == false) then
        return 1;
    end
    return 1;
end;

function OnMobWeaponSkill(target, mob, skill)
    local power = mob:getMainLvl();
    local duration = 180;
    local typeEffect = EFFECT_BLAZE_SPIKES;
    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration));
    return typeEffect;
end;

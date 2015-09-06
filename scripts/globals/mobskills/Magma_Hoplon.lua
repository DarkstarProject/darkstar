---------------------------------------------
-- Magma_Hoplon
-- Covers the user in fiery spikes and absorbs damage. Enemies that hit it take fire damage.
-- Stoneskin portion cannot be removed with dispel.
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffectOne = EFFECT_STONESKIN;
    local typeEffectTwo = EFFECT_BLAZE_SPIKES;
    local randy = math.random(40,70);
    skill:setMsg(MobBuffMove(mob, typeEffectOne, 1000, 0, 300));
    MobBuffMove(mob, typeEffectTwo, randy, 0, 180);
    local effect1 = mob:getStatusEffect(typeEffectOne);
    effect1:unsetFlag(EFFECTFLAG_DISPELABLE);

    return typeEffectOne;
end;

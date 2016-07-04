---------------------------------------------------
-- Amplification
-- Enhances Magic Attack and Magic Defense. Bonus stacks when used by mobs.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    local typeEffect1 = EFFECT_MAGIC_ATK_BOOST;
    local typeEffect2 = EFFECT_MAGIC_DEF_BOOST;
    local mabTotal = mob:getStatusEffect(EFFECT_MAGIC_ATK_BOOST);
    local mdbTotal = mob:getStatusEffect(EFFECT_MAGIC_DEF_BOOST);

    if (mob:getStatusEffect(EFFECT_MAGIC_ATK_BOOST) ~= nil) then -- mag atk bonus stacking
        mabTotal = mabTotal:getPower() + 10;
    else
        mabTotal = 10;
    end;
    if (mob:getStatusEffect(EFFECT_MAGIC_DEF_BOOST) ~= nil) then -- mag def bonus stacking
        mdbTotal = mdbTotal:getPower() + 10;
    else
        mdbTotal = 10;
    end;
    -- print(mabTotal)
    -- print(mdbTotal)

    skill:setMsg(MobBuffMove(mob, typeEffect1, mabTotal, 0, 180));
    MobBuffMove(mob, typeEffect2, mdbTotal, 0, 180);

    return typeEffect1;
end;
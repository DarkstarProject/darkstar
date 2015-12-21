---------------------------------------------
-- Reactor Cool
-- Gives Undispellable Ice Spikes and Defense Boost
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_ICE_SPIKES;
    local typeEffect2 = EFFECT_DEFENSE_BOOST;
    local randy = math.random(15,30);

    skill:setMsg(MobBuffMove(mob, typeEffect, randy, 0, 60));
        local effect1 = mob:getStatusEffect(EFFECT_ICE_SPIKES);
        effect1:unsetFlag(EFFECTFLAG_DISPELABLE);
    skill:setMsg(MobBuffMove(mob, typeEffect2, 26, 0, 60));
        local effect2 = mob:getStatusEffect(EFFECT_DEFENSE_BOOST);
        effect2:unsetFlag(EFFECTFLAG_DISPELABLE);

    return typeEffect;
end;

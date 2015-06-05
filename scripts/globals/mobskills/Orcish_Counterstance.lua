---------------------------------------------
-- Orcish Counterstance
-- Used only by Orcs in Wings of the Goddess Areas.
-- Certain NMs may have a higher power version of the effect.
---------------------------------------------
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:getContinentID() == 3) then -- THE_SHADOWREIGN_ERA = 3
        return 0;
    else
        return 1;
    end
end;

function onMobWeaponSkill(target, mob, skill)
    local power = 10;
    local duration = 60;
    local typeEffect = EFFECT_COUNTERSTANCE;

    -- if ( Conquerer Bakgodek ) then
        -- power = 50? He's not implemented yet anyway :P
    -- end

    skill:setMsg(MobBuffMove(mob, typeEffect, 10, 0, 60));

    return typeEffect;
end;
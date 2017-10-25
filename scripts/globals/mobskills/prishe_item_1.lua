---------------------------------------------
-- Prishe Item 1
---------------------------------------------
package.loaded["scripts/zones/Empyreal_Paradox/TextIDs"] = nil;
---------------------------------------------
require("scripts/zones/Empyreal_Paradox/TextIDs");
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    skill:setMsg(0);
    if (mob:getTarget() and mob:getTarget():getFamily() == 478) then
        -- using Ambrosia!
        target:addStatusEffect(EFFECT_FOOD,0,0,14400,4511);
        mob:messageText(mob, PRISHE_TEXT + 8, false);
    else
        -- using Daedalus Wing!
        mob:addTP(1000);
        mob:messageText(mob, PRISHE_TEXT + 9, false);
    end
    return 0;
end;

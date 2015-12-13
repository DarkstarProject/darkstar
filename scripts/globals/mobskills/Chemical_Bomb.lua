---------------------------------------------
--  Chemical_Bomb
--
--  Description: slow+ elegy

---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    local mobID = mob:getID();   --(16908295 ,16908302 ,16908309 =omega ,          16928966=proto-ultima   )
    local mobhp = mob:getHPP();
	local phase = mob:getLocalVar("battlePhase");

    if ((mobID == 16928966 and phase < 3) or ((mobID == 16908295 or mobID == 16908302 or mobID == 16908309) and (mobhp >= 70 or mobhp < 40))) then
        return 0;  
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect0 = EFFECT_ELEGY;
    local typeEffect1 = EFFECT_SLOW;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect0, 1, 0,30));
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect1, 1, 0,30));
    return typeEffect1;
end;

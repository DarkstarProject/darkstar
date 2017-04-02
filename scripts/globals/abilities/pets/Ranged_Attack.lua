---------------------------------------------------
-- Ranged Attack
-- Deals a ranged attack to a single target.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnAutomatonAbility(automaton, target, skill, tp, master, action)
    local numhits = 1;
    local accmod = 1;
    local dmgmod = 1.5;

    local info = MobRangedMove(automaton,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);

    local dmg = MobFinalAdjustments(info.dmg,automaton,skill,target,MOBSKILL_RANGED,MOBPARAM_PIERCE,info.hitslanded);

    if (dmg > 0) then
       target:addTP(20);
       automaton:addTP(80);
    end

    target:delHP(dmg);
    return dmg;
end;

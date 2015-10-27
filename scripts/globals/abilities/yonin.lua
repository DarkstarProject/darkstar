-----------------------------------
-- Ability: Yonin
-- Increases enmity and enhances "Ninja Tool Expertise" effect, but impairs accuracy. Improves evasion and reduces enemy Critical Hit Rate when in front of target.
-- Obtained: Ninja Level 40
-- Recast Time: 3:00
-- Duration: 5:00
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    target:delStatusEffect(EFFECT_INNIN);
    target:delStatusEffect(EFFECT_YONIN);
    target:addStatusEffect(EFFECT_YONIN,30,15,300,0,20);
end;
-----------------------------------
-- Ability: Hasso
-- Grants a bonus to attack speed, accuracy, and Strength when using two-handed weapons, but increases recast and casting times.
-- Obtained: Samurai Level 25
-- Recast Time: 1:00
-- Duration: 5:00
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (not target:isWeaponTwoHanded()) then
        return msgBasic.NEEDS_2H_WEAPON,0;
    else
        return 0,0;
    end
end;

function onUseAbility(player,target,ability)
    local strboost = target:getMainLvl()/7;
    if (target:getMainJob()~=12) then --sjob sam, use sub level
        strboost = target:getSubLvl()/7;
    end
    if (target:isWeaponTwoHanded()) then
        target:delStatusEffect(dsp.effects.HASSO);
        target:delStatusEffect(dsp.effects.SEIGAN);
        target:addStatusEffect(dsp.effects.HASSO,strboost,0,300);
    end
end;
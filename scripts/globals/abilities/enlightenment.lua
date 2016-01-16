-----------------------------------
-- Ability: Enlightenment
-- Your next spell cast may be any from your list regardless of addenda.
-- Obtained: Scholar Level 75
-- Recast Time: 0:05:00
-- Duration: 0:01:00 or 1 Spell, whichever occurs first
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if player:hasStatusEffect(EFFECT_ENLIGHTENMENT) then
        return MSGBASIC_EFFECT_ALREADY_ACTIVE, 0;
    end
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local merit = (player:getMerit(MERIT_ENLIGHTENMENT) - 5);
    player:addStatusEffect(EFFECT_ENLIGHTENMENT,merit,0,60);
    return EFFECT_ENLIGHTENMENT;
end;
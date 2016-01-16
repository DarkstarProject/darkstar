-----------------------------------
-- Ability: Camouflage
-- Become hidden from enemies.
-- Obtained: Ranger Level 20
-- Recast Time: 5:00
-- Duration: Random
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

    local duration = math.random(30, 300);

    if (target:getEquipID(SLOT_BODY) == 14224) then -- Hunter's Jerkin
        duration = duration * 1.3;
    elseif (target:getEquipID(SLOT_BODY) == 15571) then -- Hunter's Jerkin +1
        duration = duration * 1.5;
    end
    player:addStatusEffect(EFFECT_CAMOUFLAGE,1,0,(math.floor(duration) * SNEAK_INVIS_DURATION_MULTIPLIER));
end;
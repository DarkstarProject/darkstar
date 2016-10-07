-----------------------------------
-- Ability: Rampart
-- Grants a Magic Shield effect and enhances defense for party members within area of effect.
-- Obtained: Paladin Level 62
-- Recast Time: 5:00
-- Duration: 0:30
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
    local buff = 30;
    -- add 15 seconds if player wears valor coronet or its upgrade
    local head = player:getEquipID(SLOT_HEAD);
    if (head == 15078) or (head == 15251) then
        buff = buff + 15;
    end
    target:addStatusEffect(EFFECT_MAGIC_SHIELD,1,0,buff);
end;

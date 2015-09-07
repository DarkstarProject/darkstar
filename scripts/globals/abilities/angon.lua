-----------------------------------
--  Ability: Angon
--  Expends an Angon to lower an enemy's defense.
--  Obtained: Dragoon Level 75
--  Recast Time: 0:03:00
--  Duration: 0:00:30 (+0:00:15 for each merit, cap is 0:01:30)
--  Effect: Physical defense of target approximately -20% (51/256).
--  Range: 10.0 yalms
--  Notes: Only fails if it can't apply the def down status.
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    local id = player:getEquipID(SLOT_AMMO);
    if (id == 18259) then
        return 0,0;
    else
        return MSGBASIC_UNABLE_TO_USE_JA,0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local typeEffect = EFFECT_DEFENSE_DOWN;
    local duration = 15 + player:getMerit(MERIT_ANGON); -- This will return 30 sec at one investment because merit power is 15.

    if (target:addStatusEffect(typeEffect,20,0,duration) == false) then
        ability:setMsg(75);
    end

    target:updateClaim(player);
    return typeEffect;
end;
-----------------------------------
-- Ability: Shadowbind
-- Roots enemy in place.
-- Obtained: Ranger Level 40
-- Recast Time: 5:00
-- Duration: 00:30
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if ((player:getWeaponSkillType(SLOT_RANGED) == SKILL_MRK and player:getWeaponSkillType(SLOT_AMMO) == SKILL_MRK) or
    (player:getWeaponSkillType(SLOT_RANGED) == SKILL_ARC and player:getWeaponSkillType(SLOT_AMMO) == SKILL_ARC)) then
        return 0,0;
    end
    return 216,0; -- You do not have an appropriate ranged weapon equipped.
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability,action)

    if (player:getWeaponSkillType(SLOT_RANGED) == SKILL_MRK) then -- can't have your crossbow/gun held like a bow, now can we?
        action:animation(target:getID(), action:animation(target:getID()) + 1);
    end

    local duration = 30 + player:getMod(MOD_SHADOW_BIND_EXT);
    local recycleChance = player:getMod(MOD_RECYCLE) + player:getMerit(MERIT_RECYCLE);
    if (player:hasStatusEffect(EFFECT_UNLIMITED_SHOT)) then
        player:delStatusEffect(EFFECT_UNLIMITED_SHOT);
        recycleChance = 100;
    end

     -- TODO: Acc penalty for /RNG, acc vs. mob level?
    if (math.random(0, 99) >= target:getMod(MOD_BINDRES) and target:hasStatusEffect(EFFECT_BIND) == false) then
        target:addStatusEffect(EFFECT_BIND, 0, 0, duration);
        ability:setMsg(277); -- Target is bound.
    else
        ability:setMsg(158); -- Player uses Shadowbind, but misses.
    end

    if (math.random(0, 99) >= recycleChance) then
        player:removeAmmo(); -- Shadowbind depletes one round of ammo.
    end

    return EFFECT_BIND;
end;
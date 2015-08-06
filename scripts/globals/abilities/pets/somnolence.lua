---------------------------------------------------
-- Somnolence
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/magic");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill)
    local spell = getSpell(165); --gave the ability the same power as Thunder II
    local dmg = calculateMagicDamage(178,1,pet,spell,target,ELEMENTAL_MAGIC_SKILL,MOD_INT,false);
    local dINT = pet:getStat(MOD_INT) - target:getStat(MOD_INT);
    local resist = applyPlayerResistance(pet,-1,target, dINT, ELEMENTAL_MAGIC_SKILL, ELE_DARK);
    local tp = skill:getTP();
    local duration = 120;

    dmg = dmg*resist;
    dmg = mobAddBonuses(pet,spell,target,dmg, ELE_DARK);

    if (tp < 100) then
        tp = 100;
    end

    dmg = dmg * tp / 100;
    dmg = finalMagicAdjustments(pet,target,spell,dmg);

    if (resist < 0.15) then  --the gravity effect from this ability is more likely to land than Tail Whip
        resist = 0;
    end

    duration = duration * resist;

    if (duration > 0 and target:hasStatusEffect(EFFECT_WEIGHT) == false) then
        target:addStatusEffect(EFFECT_WEIGHT, 50, 0, duration);
    end

    return dmg;
end
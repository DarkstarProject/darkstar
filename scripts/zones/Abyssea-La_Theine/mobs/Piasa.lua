-----------------------------------
-- Area: Abyssea - La Theine
--  MOB: Piasa
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT, 1);
end;

function onAdditionalEffect(mob,target,damage)
    -- Resistance calcs should cause the addEffect damage to fall below 50 to get that 30-50 range wiki speaks of..
    -- But our resists don't appear to be fully retail, so we are still using randomness here instead.
    local basePower = math.random(40,50); -- Best guess off wiki and assumption of non lv/stat scaled dmg
    local params = {};
    params.bonusmab = 0;
    params.includemab = false;

    local dmg = addBonusesAbility(mob, ELE_WIND, target, basePower, params);
    dmg = dmg * applyResistanceAddEffect(mob,target,ELE_WIND,0);
    dmg = adjustForTarget(target,dmg,ELE_WIND);
    dmg = finalMagicNonSpellAdjustments(mob,target,ELE_WIND,dmg);

    return SUBEFFECT_WIND_DAMAGE, msgBasic.ADD_EFFECT_DMG, dmg;
end;

function onMobDeath(mob,player,isKiller)
end;

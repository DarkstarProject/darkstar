-----------------------------------
-- Area: Ru'Aun Gardens
--  NM:  Genbu
-----------------------------------
package.loaded["scripts/zones/RuAun_Gardens/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/RuAun_Gardens/TextIDs");
require("scripts/zones/RuAun_Gardens/MobIDs");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
end;

function onMobSpawn(mob)
end;

function onAdditionalEffect(mob, target, damage)
    local dmg = math.random(140,160)
    local params = {};
    params.bonusmab = 0;
    params.includemab = false;

    dmg = addBonusesAbility(mob, ELE_WATER, target, dmg, params);
    dmg = dmg * applyResistanceAddEffect(mob,target,ELE_WATER,0);
    dmg = adjustForTarget(target,dmg,ELE_WATER);
    dmg = finalMagicNonSpellAdjustments(mob,target,ELE_WATER,dmg);

    return SUBEFFECT_WATER_DAMAGE, msgBasic.ADD_EFFECT_DMG, dmg;
end;

function onMobDeath(mob, player, isKiller)
    player:showText(mob,SKY_GOD_OFFSET + 6);
end;

function onMobDespawn(mob)
    GetNPCByID(GENBU_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;

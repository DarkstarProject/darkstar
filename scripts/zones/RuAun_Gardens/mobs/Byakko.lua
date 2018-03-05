-----------------------------------
-- Area: Ru'Aun Gardens
--  NM:  Byakko
-----------------------------------
package.loaded["scripts/zones/RuAun_Gardens/TextIDs"] = nil;
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
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
    local dmg = math.random(35,50);
    local params = {};
    params.bonusmab = 0;
    params.includemab = false;

    dmg = addBonusesAbility(mob, ELE_LIGHT, target, dmg, params);
    dmg = dmg * applyResistanceAddEffect(mob,target,ELE_LIGHT,0);
    dmg = adjustForTarget(target,dmg,ELE_LIGHT);
    dmg = finalMagicNonSpellAdjustments(mob,target,ELE_LIGHT,dmg);

    return SUBEFFECT_LIGHT_DAMAGE, msgBasic.ADD_EFFECT_DMG, dmg;
end;

function onMobDeath(mob, player, isKiller)
    player:showText(mob,SKY_GOD_OFFSET + 12);
end;

function onMobDespawn(mob)
    GetNPCByID(BYAKKO_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;

-----------------------------------
-- Area: Ru'Aun Gardens
--  NM:  Genbu
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
    mob:setMobMod(dsp.mobMod.ADD_EFFECT,mob:getShortID());
end;

function onMobSpawn(mob)
end;

function onAdditionalEffect(mob, target, damage)
    local dmg = math.random(140,160)
    local params = {};
    params.bonusmab = 0;
    params.includemab = false;

    dmg = addBonusesAbility(mob, dsp.magic.ele.WATER, target, dmg, params);
    dmg = dmg * applyResistanceAddEffect(mob,target,dsp.magic.ele.WATER,0);
    dmg = adjustForTarget(target,dmg,dsp.magic.ele.WATER);
    dmg = finalMagicNonSpellAdjustments(mob,target,dsp.magic.ele.WATER,dmg);

    return dsp.subEffect.WATER_DAMAGE, dsp.msg.basic.ADD_EFFECT_DMG, dmg;
end;

function onMobDeath(mob, player, isKiller)
    player:showText(mob,SKY_GOD_OFFSET + 6);
end;

function onMobDespawn(mob)
    GetNPCByID(GENBU_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;

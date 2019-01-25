-----------------------------------
-- Area: Attohwa Chasm
--   NM: Alastor Antlion
-----------------------------------
mixins = {require("scripts/mixins/families/antlion_ambush_noaggro")}
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1);
    mob:setMobMod(dsp.mobMod.GA_CHANCE,50);
    mob:setMobMod(dsp.mobMod.MUG_GIL,10000);
    mob:addMod(dsp.mod.FASTCAST,10);
    mob:addMod(dsp.mod.BINDRES,40);
    mob:addMod(dsp.mod.SILENCERES,40);
end;

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.PETRIFY)
end

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- Area: Attohwa Chasm
--  NPC: Alastor Antlion
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
mixins = {require("scripts/mixins/families/antlion_ambush_noaggro")}

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
    mob:setMobMod(MOBMOD_GA_CHANCE,50);
    mob:setMobMod(MOBMOD_MUG_GIL,10000);
    mob:addMod(MOD_FASTCAST,10);
    mob:addMod(MOD_BINDRES,40);
    mob:addMod(MOD_SILENCERES,40);
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------
function onMobEngaged(mob, target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onAdditionalEffect
-----------------------------------

function onAdditionalEffect(mob, player)
    local chance = 25;
    local resist = applyResistanceAddEffect(mob,player,ELE_EARTH,EFFECT_PETRIFICATION);
    if (math.random(0,99) >= chance or resist <= 0.5) then
        return 0,0,0;
    else
        local duration = 30;
        if (mob:getMainLvl() > player:getMainLvl()) then
            duration = duration + (mob:getMainLvl() - player:getMainLvl())
        end
        duration = utils.clamp(duration,1,45);
        duration = duration * resist;
        if (not player:hasStatusEffect(EFFECT_PETRIFICATION)) then
            player:addStatusEffect(EFFECT_PETRIFICATION, 1, 0, duration);
        end
        return SUBEFFECT_PETRIFY, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_PETRIFICATION;
    end
end;

-----------------------------------
-- Area: Mount Zhayolm
--  MOB: Claret
-- !pos 501 -9 53
-- Spawned with Pectin: @additem 2591
-- Wiki: http://ffxiclopedia.wikia.com/wiki/Claret
-----------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobSpawn(mob)
    mob:addMod(MOD_REGEN, math.floor(mob:getMaxHP()*.004));
    mob:addMod(MOD_BINDRES, 40);
    mob:SetAutoAttackEnabled(false);
end;

function onMobFight(mob, target)
    if (mob:checkDistance(target) < 3) then
        if (target:hasStatusEffect(dsp.effects.POISON) == false) then
            target:addStatusEffect(dsp.effects.POISON, 100, 3, math.random(3,6) * 3); -- Poison for 3-6 ticks.
        else
            if (target:getStatusEffect(dsp.effects.POISON):getPower() < 100) then
                target:delStatusEffect(dsp.effects.POISON);
                target:addStatusEffect(dsp.effects.POISON, 100, 3, math.random(3,6) * 3); -- Poison for 3-6 ticks.
            end
        end
    end
end;

function onMobDeath(mob, player, isKiller)
end;
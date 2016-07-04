-----------------------------------
-- Area: Mount Zhayolm
--  MOB: Claret
-- @pos 501 -9 53
-- Spawned with Pectin: @additem 2591
-- Wiki: http://ffxiclopedia.wikia.com/wiki/Claret
-----------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(MOD_REGEN, math.floor(mob:getMaxHP()*.004));
    mob:addMod(MOD_BINDRES, 40);
    mob:SetAutoAttackEnabled(false);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
    if (mob:checkDistance(target) < 3) then
        if (target:hasStatusEffect(EFFECT_POISON) == false) then
            target:addStatusEffect(EFFECT_POISON, 100, 3, math.random(3,6) * 3); -- Poison for 3-6 ticks.
        else
            if (target:getStatusEffect(EFFECT_POISON):getPower() < 100) then
                target:delStatusEffect(EFFECT_POISON);
                target:addStatusEffect(EFFECT_POISON, 100, 3, math.random(3,6) * 3); -- Poison for 3-6 ticks.
            end
        end
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;
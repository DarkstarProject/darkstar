-----------------------------------
-- Area: Legion
-- Veiled_Ixion

-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/utils");
require("scripts/globals/spoofchat");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    -- MobMods
    mob:setMobMod(MOBMOD_AUTO_SPIKES, mob:getShortID()); -- Needed for auto spikes
    mob:setMobMod(MOBMOD_MAIN_2HOUR, 1);
    mob:setMobMod(MOBMOD_SUB_2HOUR, 1);

    -- mods
    mob:addMod(MOD_DOUBLE_ATTACK, 10);
    mob:addMod(MOD_TRIPLE_ATTACK, 15);

    -- Effects
    mob:addStatusEffect(EFFECT_DAMAGE_SPIKES,5,0,0); -- Needed for auto spikes
    mob:getStatusEffect(EFFECT_DAMAGE_SPIKES):setFlag(32); -- Make spikes undispellable.
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    -- Mods
    mob:setMod(MOD_REGAIN,35);
    mob:setMod(MOD_REGEN,35);
    mob:addMod(MOD_MACC,425);
    mob:addMod(MOD_ATT,105);
    mob:addMod(MOD_DEF,95);
end;

-----------------------------------

-- onMobEngaged Action
-----------------------------------

-- function onMobEngaged(mob, target)
-- end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
    local BattleStart = mob:getLocalVar("BattleStart");
    local Veiled_Ixion_2hr = 0;
    if (mob:getLocalVar("Veiled_Ixion_2hr") ~= nil) then
        Veiled_Ixion_2hr = mob:getLocalVar("Veiled_Ixion_2hr");
    end

    if (mob:getHPP() <= 10) then
        if (Veiled_Ixion_2hr == 0) then
            mob:useMobAbility(437); -- PD
            mob:setLocalVar("Veiled_Ixion_2hr", 1);
        end
    end
end;

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

-- function onAdditionalEffect(mob,target,damage)
-- end;

-----------------------------------
-- onMagicHit
-----------------------------------

-- function onMagicHit(caster, target, spell)
    -- return spell
-- end

-----------------------------------
-- onSpikesDamage
-----------------------------------

function onSpikesDamage(mob,target,damage)
    -- Set to always proc.
    local dmg = math.random(1,3);
    local INT_diff = mob:getStat(MOD_INT) - target:getStat(MOD_INT);
    if (INT_diff > 20) then
        INT_diff = 20 + (INT_diff - 20);
    end
    INT_diff = INT_diff * 0.25;
    dmg = dmg + INT_diff * 0.25;
    dmg = utils.clamp(dmg, 1, 99);
    -- Shockspikes stun is handled in the C++ core.
    return SUBEFFECT_SHOCK_SPIKES,44,dmg;
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    killer:addCurrency("legion_point", 15);
    SpawnMob(mob:getID()+3) -- Spawns Veiled_Alicorn
end;
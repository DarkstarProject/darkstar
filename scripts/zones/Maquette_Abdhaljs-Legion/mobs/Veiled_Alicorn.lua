-----------------------------------
-- Area: Legion
-- Veiled_Alicorn

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

    -- Mods
    mob:addMod(MOD_DOUBLE_ATTACK, 20);
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
    mob:setMod(MOD_REGAIN,30);
    mob:setMod(MOD_REGEN,35);
    mob:setMod(MOD_HASTE_ABILITY, 10);
    mob:addMod(MOD_MACC,425);
    mob:addMod(MOD_ACC,225);
    mob:addMod(MOD_MDEF,55);
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
    local Veiled_Alicorn_2hr = mob:getLocalVar("Veiled_Alicorn_2hr");

    if (mob:getHPP() <= 15) then
        if (Veiled_Alicorn_2hr == 1) then
            mob:useMobAbility(437); -- PD
            mob:setLocalVar("Veiled_Alicorn_2hr", 2);
        end
    elseif (mob:getHPP() <= 60) then
        if (Veiled_Alicorn_2hr == 0) then
            mob:useMobAbility(432); -- MS
            mob:setLocalVar("Veiled_Alicorn_2hr", 1);
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
    local MND_diff = mob:getStat(MOD_MND) - target:getStat(MOD_MND);
    if (MND_diff > 20) then
        MND_diff = 20 + (MND_diff - 20);
    end
    MND_diff = MND_diff * 0.25;
    dmg = dmg + MND_diff * 0.25;
    dmg = utils.clamp(dmg, 1, 99);
    target:addTP(-dmg*0.5); -- Veiled Ixion got stun to slow down melee dmg..I figure Veiled Alicorn can -tp the melees instead.
    return SUBEFFECT_REPRISAL,44,dmg; -- Mobs can do this without a shield, eat your heart out Paladins!
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    killer:addCurrency("legion_point", 30);
end;
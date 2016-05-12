-----------------------------------
-- Area: RoMaeve
--  NM:  Martinet
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_AUTO_SPIKES,mob:getShortID());
    mob:addStatusEffect(EFFECT_SHOCK_SPIKES,55,0,0);
    mob:getStatusEffect(EFFECT_SHOCK_SPIKES):setFlag(32);
end;

-----------------------------------
-- onSpikesDamage
-----------------------------------

function onSpikesDamage(mob,target,damage)
    local INT_diff = mob:getStat(MOD_INT) - target:getStat(MOD_INT);

    if (INT_diff > 20) then
        INT_diff = 20 + ((INT_diff - 20)*0.5); -- INT above 20 is half as effective.
    end

    local dmg = ((damage+INT_diff)*0.5); -- INT adjustment and base damage averaged together.
    local params = {};
    params.bonusmab = 0;
    params.includemab = false;
    dmg = addBonusesAbility(mob, ELE_THUNDER, target, dmg, params);
    dmg = dmg * applyResistanceAddEffect(mob,target,ELE_THUNDER,0);
    dmg = adjustForTarget(target,dmg,ELE_THUNDER);
    dmg = finalMagicNonSpellAdjustments(mob,target,ELE_THUNDER,dmg);

    if (dmg < 0) then
        dmg = 0;
    end    

    return SUBEFFECT_SHOCK_SPIKES,44,dmg;

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    -- UpdateNMSpawnPoint(mob:getID());
    -- mob:setRespawnTime(math.random((?),(?))); -- Uncertain repop time
end;

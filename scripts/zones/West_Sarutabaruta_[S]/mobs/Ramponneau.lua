-----------------------------------
-- Area: West Sarutabaruta (S)
--   NM: Ramponneau
-----------------------------------
 
require("scripts/globals/status");
require("scripts/globals/magic");
 
-----------------------------------
-- onMobInitialize Action
-----------------------------------
 
function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT, mob:getShortID());
    mob:addStatusEffect(EFFECT_SHOCK_SPIKES, 10, 0, 0);
    mob:getStatusEffect(EFFECT_SHOCK_SPIKES):setFlag(32);
end;
 
-----------------------------------
-- onMobFight Action
-----------------------------------
 
function onMobFight(mob,target)
    mob:SetMobAbilityEnabled(false);
end;
 
-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
 
function onAdditionalEffect(mob,target,damage)
    local power = math.random(4,15);
    local params = {};
    params.bonusmab = 0;
    params.includemab = false;
    power = addBonusesAbility(mob, ELE_ICE, target, power, params);
    power = power * applyResistanceAddEffect(mob, target, ELE_ICE, 0);
    power = adjustForTarget(target, power, ELE_ICE);
    power = finalMagicNonSpellAdjustments(mob, target, ELE_ICE, power);
 
    local message = MSGBASIC_ADD_EFFECT_DMG;
    if (power < 0) then
        message = MSGBASIC_ADD_EFFECT_HEAL;
    end
 
    return SUBEFFECT_ICE_DAMAGE, message, power;
end;
 
-----------------------------------
-- onMobDeath
-----------------------------------
 
function onMobDeath(mob,killer)
 
    -- Set Ramponneau's Window Open Time
    local wait = 5400 -- 90 minutes
    SetServerVariable("[POP]Ramponneau", os.time(t) + wait );
    DeterMob(mob:getID(), true);
 
    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Ramponneau");
    SetServerVariable("[PH]Ramponneau", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));
 
end;
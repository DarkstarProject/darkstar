----------------------------------
-- Area: Cape Teriggan
--  NM:  Tegmine
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------


-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
end;

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(mob,target,damage)
    local diff = mob:getStat(MOD_INT) - target:getStat(MOD_INT);

    if (diff > 20) then
        diff = 20 + (diff - 20) / 2;
    end

    local dmg_base = diff + (mob:getMainLvl() - target:getMainLvl()) + damage/2;
    local dmg_rand = math.random(69,96);
    local dmg = (dmg_base + dmg_rand)/2;
    local params = {};
    params.bonusmab = 0;
    params.includemab = false;
    dmg = addBonusesAbility(mob, ELE_WATER, target, dmg, params);
    dmg = dmg * applyResistanceAddEffect(mob,target,ELE_WATER,0);
    dmg = adjustForTarget(target,dmg,ELE_WATER);
	dmg = finalMagicNonSpellAdjustments(mob,target,ELE_WATER,dmg);
    
    local message = 163;
    if (dmg < 0) then
        message = 167;
    end
    
    return SUBEFFECT_WATER_DAMAGE,message,dmg;
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    -- UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((7200),(7800))); -- 120 to 130 min
end;
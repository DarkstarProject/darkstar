-----------------------------------
-- Area: Beaucedine Glacier
--  NM:  Calcabrina
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
    -- wiki just says "low proc rate". No actual data to go on - going with 15% for now.
    local chance = 15;
    if (mob:getMainLvl() > target:getMainLvl()) then
        chance = chance - 5 * (mob:getMainLvl() - target:getMainLvl())
        chance = utils.clamp(chance, 5, 95);
    end

    if (math.random(0,99) >= chance) then
        return 0,0,0;
    else
        local diff = target:getStat(MOD_INT) - mob:getStat(MOD_INT);

        if (diff > 20) then
            diff = 20 + (diff - 20) / 2;
        end

        local drain = diff + (mob:getMainLvl() - target:getMainLvl()) + damage/2;
        local params = {};
        params.bonusmab = 0;
        params.includemab = false;
        drain = addBonusesAbility(target, ELE_DARK, mob, drain, params);
        drain = drain * applyResistanceAddEffect(target,mob,ELE_DARK,0);
        drain = adjustForTarget(target,drain,ELE_DARK);

        if (drain < 0) then
            drain = 0
        end

        drain = finalMagicNonSpellAdjustments(target,mob,ELE_DARK,drain);
        return SUBEFFECT_HP_DRAIN, 161, mob:addHP(drain);
    end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((5400),(6000)));
end;

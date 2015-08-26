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
    local LV_diff = target:getMainLvl() - mob:getMainLvl();

    if (target:getMainLvl() > mob:getMainLvl()) then
        chance = chance - 5 * LV_diff
        chance = utils.clamp(chance, 5, 95);
    end

    if (math.random(0,99) >= chance) then
        return 0,0,0;
    else
        local INT_diff = mob:getStat(MOD_INT) - target:getStat(MOD_INT);

        if (INT_diff > 20) then
            INT_diff = 20 + (INT_diff - 20) / 2;
        end

        local drain = INT_diff+LV_diff+damage/2;
        local params = {};
        params.bonusmab = 0;
        params.includemab = false;
        drain = addBonusesAbility(mob, ELE_DARK, target, drain, params);
        drain = drain * applyResistanceAddEffect(mob,target,ELE_DARK,0);
        drain = adjustForTarget(target,drain,ELE_DARK);
        drain = finalMagicNonSpellAdjustments(target,mob,ELE_DARK,drain);

        if (drain <= 0) then
            drain = 0;
        else
            mob:addHP(drain);
        end

        return SUBEFFECT_HP_DRAIN, MSGBASIC_ADD_EFFECT_HP_DRAIN, drain;
    end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((5400),(6000)));
end;

-----------------------------------
-- Area: Beaucedine Glacier
-- NM:   Calcabrina
-----------------------------------
require("scripts/globals/status");
-----------------------------------


-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
    -- mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
end;

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(mob,target,damage)
    -- wiki just says "low proc rate". No actual data to go on - going with 15% for now.
    local chance = 15;
    if (target:getMainLvl() > mob:getMainLvl()) then
        chance = chance - 5 * (target:getMainLvl() - mob:getMainLvl())
        chance = utils.clamp(chance, 5, 95);
    end

    if (math.random(0,99) >= chance) then
        return 0,0,0;
    else
        local diff = mob:getStat(MOD_INT) - target:getStat(MOD_INT);

        if (diff > 20) then
            diff = 20 + (diff - 20) / 2;
        end

        local drain = diff + (mob:getMainLvl() - target:getMainLvl()) + damage/2;
        local params = {};
        params.bonusmab = 0;
        params.includemab = false;
        drain = addBonusesAbility(player, ELE_DARK, target, drain, params);
        drain = drain * applyResistanceAddEffect(player,target,ELE_DARK,0);
        drain = adjustForTarget(target,drain,ELE_DARK);

        if (drain < 0) then
            drain = 0
        end

        drain = finalMagicNonSpellAdjustments(player,target,ELE_DARK,drain);
        return SUBEFFECT_HP_DRAIN, 161, mob:addHP(drain);
    end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
end;

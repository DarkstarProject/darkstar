-----------------------------------
-- Area: Beaucedine Glacier
--  NM:  Calcabrina
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1);
end;

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
        local INT_diff = mob:getStat(dsp.mod.INT) - target:getStat(dsp.mod.INT);

        if (INT_diff > 20) then
            INT_diff = 20 + (INT_diff - 20) / 2;
        end

        local drain = INT_diff+LV_diff+damage/2;
        local params = {};
        params.bonusmab = 0;
        params.includemab = false;
        drain = addBonusesAbility(mob, dsp.magic.ele.DARK, target, drain, params);
        drain = drain * applyResistanceAddEffect(mob,target,dsp.magic.ele.DARK,0);
        drain = adjustForTarget(target,drain,dsp.magic.ele.DARK);
        drain = finalMagicNonSpellAdjustments(target,mob,dsp.magic.ele.DARK,drain);

        if (drain <= 0) then
            drain = 0;
        else
            mob:addHP(drain);
        end

        return dsp.subEffect.HP_DRAIN, dsp.msg.basic.ADD_EFFECT_HP_DRAIN, drain;
    end

end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(5400,6000));
end;

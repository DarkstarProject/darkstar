----------------------------------
-- Area: Cape Teriggan
--  NM:  Tegmine
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1);
end;

function onAdditionalEffect(mob,target,damage)
    -- Wiki says nothing about proc rate, going with 80% for now.
    -- I remember it going off every hit when I fought him.
    local chance = 80;
    local LV_diff = target:getMainLvl() - mob:getMainLvl();

    if (target:getMainLvl() > mob:getMainLvl()) then
        chance = chance - 5 * LV_diff;
        chance = utils.clamp(chance, 5, 95);
    end

    if (math.random(0,99) >= chance) then
        return 0,0,0;
    else
        local INT_diff = mob:getStat(dsp.mod.INT) - target:getStat(dsp.mod.INT);

        if (INT_diff > 20) then
            INT_diff = 20 + (INT_diff - 20) / 2;
        end

        local dmg = INT_diff+LV_diff+damage/2;
        local params = {};
        params.bonusmab = 0;
        params.includemab = false;
        dmg = addBonusesAbility(mob, dsp.magic.ele.WATER, target, dmg, params);
        dmg = dmg * applyResistanceAddEffect(mob,target,dsp.magic.ele.WATER,0);
        dmg = adjustForTarget(target,dmg,dsp.magic.ele.WATER);

        dmg = finalMagicNonSpellAdjustments(mob,target,dsp.magic.ele.WATER,dmg);

        return dsp.subEffect.WATER_DAMAGE, dsp.msg.basic.ADD_EFFECT_DMG, dmg;
    end

end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    -- UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((7200),(7800))); -- 120 to 130 min
end;

-----------------------------------
-- Area: Crawlers nest [S] (171)
--  NM:  Morille Mortelle
-- !pos 59.788 -0.939 22.316 171
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");

function onMobSpawn(mob)
    mob:setMod(MOD_DOUBLE_ATTACK, 20);
    mob:setMod(MOD_STORETP, 10);
end;

function onAdditionalEffect(mob, player)
    local chance = 25;
    local resist = applyResistanceAddEffect(mob,player,ELE_WATER,EFFECT_PLAGUE);
    if (math.random(0,99) >= chance or resist <= 0.5) then
        return 0,0,0;
    else
        local duration = 30;
        if (mob:getMainLvl() > player:getMainLvl()) then
            duration = duration + (mob:getMainLvl() - player:getMainLvl())
        end
        duration = utils.clamp(duration,1,45);
        duration = duration * resist;
        if (not player:hasStatusEffect(EFFECT_PLAGUE)) then
            player:addStatusEffect(EFFECT_PLAGUE, 1, 0, duration);
        end
        return SUBEFFECT_PLAGUE, msgBasic.ADD_EFFECT_STATUS, EFFECT_PLAGUE;
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
end;

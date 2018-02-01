-----------------------------------
-- Area: Sealions Den
--  MOB: Ultima
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/msg");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT, 1);
end;

function onMobSpawn(mob)
end;

function onMobFight(mob,target)
    -- Gains regain at under 25% HP
    if (mob:getHP() < (mob:getMaxHP() * 0.25)) then
        if (mob:hasStatusEffect(EFFECT_REGAIN) == false) then
            mob:addStatusEffect(EFFECT_REGAIN,5,3,0);
            mob:getStatusEffect(EFFECT_REGAIN):setFlag(32);
        end
    end
end;

function onAdditionalEffect(mob, player)
    local chance = 20;
    local resist = applyResistanceAddEffect(mob,player,ELE_ICE,EFFECT_PARALYSIS);
    if (math.random(0,99) >= chance or resist <= 0.5) then
        return 0,0,0;
    else
        local duration = 60;
        local power = 20;
        duration = duration * resist;
        if (player:hasStatusEffect(EFFECT_PARALYSIS) == false) then
            player:addStatusEffect(EFFECT_PARALYSIS, power, 0, duration);
        end
        return SUBEFFECT_PARALYSIS, msgBasic.ADD_EFFECT_STATUS, EFFECT_PARALYSIS;
    end
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(ULTIMA_UNDERTAKER);
end;
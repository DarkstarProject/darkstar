-----------------------------------
-- Area: Western Altepa Desert
--   NM: King Vinegarroon
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/titles");
require("scripts/globals/weather");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;


-----------------------------------
-- onMobDrawIn
-----------------------------------

function onMobDrawIn(mob, target)
    -- todo make him use AoE tp move
    mob:addTP(3000);
end;

-----------------------------------
-- onMobDisengage
-----------------------------------

function onMobDisengage(mob, weather)

    if (weather ~= WEATHER_DUST_STORM and weather ~= WEATHER_SAND_STORM) then
        DespawnMob(mob:getID());
    end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    player:addTitle(VINEGAR_EVAPORATOR);

    -- Set King_Vinegarroon's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(75600,86400));

end;

-----------------------------------
-- onAdditionalEffect
-----------------------------------

function onAdditionalEffect(mob, player)
    local resist = applyResistanceAddEffect(mob,player,ELE_EARTH,EFFECT_PETRIFICATION);
    if (resist <= 0.5) then -- "Has an innate Additional Effect of Petrification on all of its physical attacks. "
        return 0,0,0;
    else
        local duration = 30;
        if (mob:getMainLvl() > player:getMainLvl()) then
            duration = duration + (mob:getMainLvl() - player:getMainLvl())
        end
        duration = utils.clamp(duration,1,45);
        duration = duration * resist;
        if (not player:hasStatusEffect(EFFECT_PETRIFICATION)) then
            player:addStatusEffect(EFFECT_PETRIFICATION, 1, 0, duration);
        end
        return SUBEFFECT_PETRIFY, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_PETRIFICATION;
    end
end;
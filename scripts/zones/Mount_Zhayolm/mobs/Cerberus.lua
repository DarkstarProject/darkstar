-----------------------------------
-- Area: Mount Zhayolm
--  NM:  Cerberus
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob, target)
    if (mob:getHPP() > 25) then
        mob:setMod(MOD_REGAIN, 10)
    else
        mob:setMod(MOD_REGAIN, 70)
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(CERBERUS_MUZZLER);
    mob:setRespawnTime((math.random(0,24)*3600)+172800); -- 48-72 hours proper 1 hour windows
end;

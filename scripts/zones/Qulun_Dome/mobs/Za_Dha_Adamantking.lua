-----------------------------------
-- Area: Qulun Dome
--  NM:  Za Dha Adamantking
-----------------------------------

require("scripts/globals/titles");
require("scripts/zones/Qulun_Dome/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    -- TODO: Addtionaleffect:Slow on melee attacks
    mob:showText(mob,QUADAV_KING_ENGAGE);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    player:addTitle(ADAMANTKING_USURPER);
    mob:showText(mob,QUADAV_KING_DEATH);

    -- Set Za_Dha_Adamantking's Window Open Time
    local wait = 48 * 3600
    SetServerVariable("[POP]Za_Dha_Adamantking", os.time(t) + wait); -- 2 days

    -- Set Diamond_Quadav's spawnpoint and respawn time (21-24 hours)
    local Diamond_Quadav = 17383442;
    DeterMob(Diamond_Quadav, false);
    GetMobByID(Diamond_Quadav):setRespawnTime(math.random(75600,86400)); -- 21 to 24 hours

end;
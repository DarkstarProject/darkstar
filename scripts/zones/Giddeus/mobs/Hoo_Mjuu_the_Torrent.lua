-----------------------------------
-- Area: Giddeus (145)
--   NM: Hoo Mjuu the Torrent
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
-----------------------------------

function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.BENEDICTION, hpp = math.random(10, 50)},
        },
    })
end;

function onMobDeath(mob, player, isKiller)
end;

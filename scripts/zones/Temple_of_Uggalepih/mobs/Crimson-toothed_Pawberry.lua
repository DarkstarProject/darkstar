-----------------------------------
-- Area: Temple of Uggalepih
--  MOB: Crimson-toothed Pawberry
-----------------------------------
mixins =
{
    require("scripts/mixins/families/tonberry"),
    require("scripts/mixins/job_special")
}
-----------------------------------

function onMobDeath(mob, player, isKiller)
    SetServerVariable("[POP]Crimson-toothed_Pawberry",os.time() + 900) -- 15min
end

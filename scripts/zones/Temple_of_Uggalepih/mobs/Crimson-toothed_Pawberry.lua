-----------------------------------
-- Area: Temple of Uggalepih
--  MOB: Crimson-toothed Pawberry
-----------------------------------
mixins = {require("scripts/mixins/families/tonberry")}
mixins = {require("scripts/mixins/job_special")};

require("scripts/globals/status");

function onMobDeath(mob, player, isKiller)
    SetServerVariable("[POP]Crimson-toothed_Pawberry",os.time() + 900); -- 15min
end;

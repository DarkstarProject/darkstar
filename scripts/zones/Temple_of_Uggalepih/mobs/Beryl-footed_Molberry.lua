-----------------------------------
-- Area: Temple of Uggalepih
--  NM:  Beryl-footed Molberry
-----------------------------------
mixins = {require("scripts/mixins/families/tonberry")}

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    SetServerVariable("[POP]Beryl-footed_Molberry",os.time() + 900); -- 15min
end;

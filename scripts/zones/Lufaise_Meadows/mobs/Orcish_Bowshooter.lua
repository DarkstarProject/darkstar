-----------------------------------
-- Area: Lufaise_Meadows
--  MOB: Orcish Bowshooter
-----------------------------------


-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local kills = player:getVar("FOMOR_HATE");

    if (kills > 0) then
        player:setVar("FOMOR_HATE",kills -1);
    end
end;
-----------------------------------
-- Zone: Lufaise_Meadows
-- Mob:  Sengann
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
    if (kills < 60) then
        player:setVar("FOMOR_HATE",kills + 2);
    end
end;
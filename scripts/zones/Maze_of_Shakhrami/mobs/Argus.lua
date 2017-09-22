-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Argus (NM)
-----------------------------------

require("scripts/zones/Maze_of_Shakhrami/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local whichNM = math.random(0,19);

    if (whichNM < 10) then
        SetRespawnTime(Argus, 64800, 108000); -- 18-30 hours
        DisallowRespawn(Leech_King, true);
    else
        SetRespawnTime(Leech_King, 64800, 108000); -- 18-30 hours
        DisallowRespawn(Argus, true);
    end

end;

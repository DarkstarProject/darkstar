-----------------------------------
-- Area: Xarcabard
--  MOB: Koenigstiger
-- Involved in Quests: Unbridled Passion (RNG AF3)
-- @zone 112
-----------------------------------

require("scripts/globals/quests");

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    local UnbridledPassionCS = player:getVar("unbridledPassion");

    if (UnbridledPassionCS == 4) then
        player:setVar("unbridledPassion",5);
    end

end;
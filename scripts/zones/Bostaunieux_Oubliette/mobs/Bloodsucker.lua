-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--  MOB: Bloodsucker (NM)
-- !pos -21.776 16.983 -231.477 167
-----------------------------------
local ID = require("scripts/zones/Bostaunieux_Oubliette/IDs");
require("scripts/globals/regimes")

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 613, 1, dsp.regime.type.GROUNDS)
end;

function onMobDespawn(mob)
    if (mob:getID() == ID.mob.BLOODSUCKER) then
        UpdateNMSpawnPoint(mob);
        mob:setRespawnTime(3600);
    end
end;

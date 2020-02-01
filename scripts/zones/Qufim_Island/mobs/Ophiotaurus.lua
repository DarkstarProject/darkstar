-----------------------------------
-- Area: Qufim Island
--  MOB: Ophiotaurus
-----------------------------------
local ID = require("scripts/zones/Qufim_Island/IDs")
require("scripts/globals/missions")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local party = player:getParty()
    for _, member in ipairs(party) do
        if member:getCurrentMission(ROV) == dsp.mission.id.rov.THE_LIONS_ROAR then
            member:completeMission(ROV, dsp.mission.id.rov.THE_LIONS_ROAR)
            member:addMission(ROV, dsp.mission.id.rov.EDDIES_OF_DESPAIR_I)
        end
    end
end

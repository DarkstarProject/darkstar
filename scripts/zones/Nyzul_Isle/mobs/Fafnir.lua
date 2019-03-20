-----------------------------------
-- Area: Nyzul Isle Investigation
--  MOB: Fafnir
-----------------------------------
local ID = require("scripts/zones/Nyzul_Isle/IDs")
require("scripts/globals/status")
-----------------------------------

function onMobDeath(mob, player)
    local instance = mob:getInstance()
    instance:setProgress(15)
end

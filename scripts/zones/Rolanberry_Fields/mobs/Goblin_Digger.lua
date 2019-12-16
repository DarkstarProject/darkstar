-----------------------------------
-- Area: Rolanberry Fields
--  Mob: Goblin Digger
-----------------------------------
local ID = require("scripts/zones/Rolanberry_Fields/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 86, 2, dsp.regime.type.FIELDS)

    if ENABLE_ACP == 1 and player:getCurrentMission(ACP) >= dsp.mission.id.acp.THE_ECHO_AWAKENS and not player:hasKeyItem(dsp.ki.JUG_OF_GREASY_GOBLIN_JUICE) then
        -- Guesstimating 15% chance
        if math.random(100) <= 15 then
            player:addKeyItem(dsp.ki.JUG_OF_GREASY_GOBLIN_JUICE)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.JUG_OF_GREASY_GOBLIN_JUICE)
        end
    end
end
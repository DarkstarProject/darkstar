-----------------------------------
-- Area: Sauromugue Champaign
--  Mob: Goblin Bounty Hunter
-----------------------------------
local ID = require("scripts/zones/Sauromugue_Champaign/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/settings")
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 97, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 98, 2, dsp.regime.type.FIELDS)

    if ENABLE_ACP == 1 and not player:hasKeyItem(dsp.ki.CHUNK_OF_SMOKED_GOBLIN_GRUB) and player:getCurrentMission(ACP) >= dsp.mission.id.acp.THE_ECHO_AWAKENS then
        -- Guesstimating 15% chance
        if math.random(100) >= 85 then
            player:addKeyItem(dsp.ki.CHUNK_OF_SMOKED_GOBLIN_GRUB)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.CHUNK_OF_SMOKED_GOBLIN_GRUB)
        end
    end
end
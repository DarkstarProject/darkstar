-----------------------------------
-- Area: Sauromugue Champaign
--  NPC: qm1 (???)
-- !pos 203.939 0.000 -238.811 120
-- Notes: Spawns Dribblix Greasemaw for ACP mission "Gatherer of Light (I)"
-----------------------------------
local ID = require("scripts/zones/Sauromugue_Champaign/IDs")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if
        not GetMobByID(ID.mob.DRIBBLIX_GREASEMAW):isSpawned() and
        player:hasKeyItem(dsp.ki.CHUNK_OF_SMOKED_GOBLIN_GRUB) and
        not player:hasKeyItem(dsp.ki.SEEDSPALL_VIRIDIS) and
        not player:hasKeyItem(dsp.ki.VIRIDIAN_KEY)
    then
        SpawnMob(ID.mob.DRIBBLIX_GREASEMAW):updateClaim(player)
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end

-----------------------------------
-- Area: Xarcabard
--   NM: Boreal Hound
-- Involved in Quests: Atop the Highest Mountains
-- !pos -21 -25 -490 112
-----------------------------------
local ID = require("scripts/zones/Xarcabard/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/quests")
-----------------------------------

function onMobSpawn(mob)
    -- Failsafe to make sure NPC is down when NM is up
    if OLDSCHOOL_ENABLED then
        GetNPCByID(ID.npc.BOREAL_HOUND_QM):showNPC(0)
    end
end

function onMobDeath(mob, player, isKiller)
    if OLDSCHOOL_ENABLED then
        -- Show ??? for desired duration
        -- Notify people on the quest who need the KI
        GetNPCByID(ID.npc.BOREAL_HOUND_QM):showNPC(30)
        if player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.ATOP_THE_HIGHEST_MOUNTAINS) == QUEST_ACCEPTED and not player:hasKeyItem(dsp.ki.TRIANGULAR_FRIGICITE) then
            player:messageSpecial(ID.text.BLOCKS_OF_ICE)
        end
    end
end

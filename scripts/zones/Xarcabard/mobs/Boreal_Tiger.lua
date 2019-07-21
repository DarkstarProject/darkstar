-----------------------------------
-- Area: Xarcabard
--   NM: Boreal Tiger
-- Involved in Quests: Atop the Highest Mountains
-- !pos 341 -29 370 112
-----------------------------------
local ID = require("scripts/zones/Xarcabard/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/quests")
-----------------------------------

function onMobSpawn(mob)
    -- Failsafe to make sure NPC is down when NM is up
    if OldSchoolG2 then
        GetNPCByID(ID.npc.BOREAL_TIGER_QM):showNPC(0)
    end
end

function onMobDeath(mob, player, isKiller)
    if OldSchoolG2 then
        -- show ??? for desired duration
        -- notify people on the quest who need the KI
        GetNPCByID(ID.npc.BOREAL_TIGER_QM):showNPC(FrigiciteDuration)
        if player:getQuestStatus(JEUNO, dsp.quest.id.jeuno.ATOP_THE_HIGHEST_MOUNTAINS) == QUEST_ACCEPTED and not player:hasKeyItem(dsp.ki.ROUND_FRIGICITE) then
            player:messageSpecial(ID.text.BLOCKS_OF_ICE)
        end
    end
end

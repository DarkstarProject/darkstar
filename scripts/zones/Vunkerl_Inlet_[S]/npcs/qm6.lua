-----------------------------------
-- Area: Vunkerl_Inlet_[S]
--  NPC: qm6 (???)
-- Involved In Quest: EVIL_AT_THE_INLET
-- !pos -636 -51 -454 83
-----------------------------------
package.loaded["scripts/zones/Vunkerl_Inlet_[S]/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Vunkerl_Inlet_[S]/TextIDs")
require("scripts/globals/npc_util")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local Eati = player:getQuestStatus(CRYSTAL_WAR, EVIL_AT_THE_INLET)

    if Eati == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.EVIL_WARDING_SEAL) then
        player:startEvent(112)
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 112 then
        player:delKeyItem(dsp.ki.EVIL_WARDING_SEAL)
    end
end

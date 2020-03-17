-----------------------------------
-- Area: Vunkerl_Inlet_[S]
--  NPC: qm6 (???)
-- Involved In Quest: EVIL_AT_THE_INLET
-- !pos -636 -51 -454 83
-----------------------------------
local ID = require("scripts/zones/Vunkerl_Inlet_[S]/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local Eati = player:getQuestStatus(CRYSTAL_WAR, tpz.quest.id.crystalWar.EVIL_AT_THE_INLET)

    if Eati == QUEST_ACCEPTED and player:hasKeyItem(tpz.ki.EVIL_WARDING_SEAL) then
        player:startEvent(112)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 112 then
        player:delKeyItem(tpz.ki.EVIL_WARDING_SEAL)
    end
end

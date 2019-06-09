-----------------------------------
-- Area: Xarcabard (112)
-- NPC: Option One
-- AMK13 Quiz
-- !pos  X 125.8392  Y -23.6698  Z -118.0060
-----------------------------------
local ID = require("scripts/zones/Xarcabard/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    -- TODO: Packet capture to find out event ids for questions

    -- Possible offset     <field name="index">7722</field>
    -- <field name="index">8106</field>
    -- <field name="text">Welcome to “Vrtra's 64,000,000 Gil Question”--a challenging quiz of discernment and derring-do!≺Prompt≻
    local youCouldBeAWinner = player:getCurrentMission(AMK) == dsp.mission.id.amk.A_CHALLENGE_YOU_COULD_BE_A_WINNER
    if youCouldBeAWinner and not player:hasKeyItem(dsp.ki.GAUNTLET_CHALLENGE_KUPON) then
        npcUtil.giveKeyItem(player, dsp.ki.GAUNTLET_CHALLENGE_KUPON)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
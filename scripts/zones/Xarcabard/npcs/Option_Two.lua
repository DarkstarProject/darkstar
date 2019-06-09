-----------------------------------
-- Area: Xarcabard (112)
-- NPC: Option Two
-- AMK13 Quiz
-- !pos X 65.7104  Y -23.6038  Z -191.4515
-----------------------------------
local ID = require("scripts/zones/Xarcabard/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
    -- TODO: Packet capture to find out event ids for questions

    -- Possible offset     <field name="index">7722</field>
    -- <field name="index">8106</field>
    -- <field name="text">Welcome to “Vrtra's 64,000,000 Gil Question”--a challenging quiz of discernment and derring-do!≺Prompt≻
    local youCouldBeAWinner = player:getCurrentMission(AMK) == dsp.mission.id.amk.A_CHALLENGE_YOU_COULD_BE_A_WINNER
    if youCouldBeAWinner and not player:hasKeyItem(dsp.ki.GAUNTLET_CHALLENGE_KUPON) then
        npcUtil.giveKeyItem(player, dsp.ki.GAUNTLET_CHALLENGE_KUPON)
    end
end

function onTrigger(player,npc)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
-----------------------------------
-- Area: Castle Zvahl Baileys 161
-- NPC: Flame of Fate
-- A Moogle Kupo d'Etat
-- !pos X -155.2186  Y -24.0000  Z 16.9237
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local youCouldBeAWinner = player:getCurrentMission(AMK) == dsp.mission.id.amk.A_CHALLENGE_YOU_COULD_BE_A_WINNER
    local gauntletCoupon = player:hasKeyItem(dsp.ki.GAUNTLET_CHALLENGE_KUPON)

    -- TODO: Check for race condition
    if youCouldBeAWinner and gauntletCoupon then
        -- player:startEvent(101, 1) -- Out of time
        player:startEvent(101, 2) -- Success
    end 
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 101 then
        if not player:hasKeyItem(dsp.ki.FESTIVAL_SOUVENIR_KUPON) then
            npcUtil.giveKeyItem(player, dsp.ki.FESTIVAL_SOUVENIR_KUPON)
        end
    end
end

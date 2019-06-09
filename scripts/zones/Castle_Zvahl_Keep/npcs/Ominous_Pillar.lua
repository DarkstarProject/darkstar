-----------------------------------
-- Area: Castle Zvahl Keep
-- NPC: Ominous Pillar
-- A Moogle Kupo d'Etat
-- !pos X -6.8002  Y 0.0000  Z -22.9184
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local youCouldBeAWinner = player:getCurrentMission(AMK) == dsp.mission.id.amk.A_CHALLENGE_YOU_COULD_BE_A_WINNER
    local festivalCoupon = player:hasKeyItem(dsp.ki.FESTIVAL_SOUVENIR_KUPON)

    if youCouldBeAWinner and FESTIVAL_SOUVENIR_KUPON then
        player:startEvent(100, 1)
        -- player:startEvent(100, 2) -- Reminder
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 100 then
        -- Set var for search
    end
end

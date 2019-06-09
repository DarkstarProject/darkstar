-----------------------------------
-- Area: Castle Zvahl Keep
-- NPC: Craggy Pillar
-- A Moogle Kupo d'Etat
-- !pos X  X -368.0163  Y -52.0000  Z -126.6989
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local youCouldBeAWinner = player:getCurrentMission(AMK) == dsp.mission.id.amk.A_CHALLENGE_YOU_COULD_BE_A_WINNER
    local festivalCoupon = player:hasKeyItem(dsp.ki.FESTIVAL_SOUVENIR_KUPON)

    -- TODO: Fix me
    player:startEvent(101, 1)
    if youCouldBeAWinner and FESTIVAL_SOUVENIR_KUPON then
        -- player:startEvent(101, 1)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    print(csid)
    if csid == 101 then
        if not player:hasKeyItem(dsp.ki.MEGA_BONANZA_KUPON) then
            npcUtil.giveKeyItem(player, dsp.ki.MEGA_BONANZA_KUPON)
        end
    end
end

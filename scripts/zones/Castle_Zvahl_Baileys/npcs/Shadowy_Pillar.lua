-----------------------------------
-- Area: Castle Zvahl Baileys 161
-- NPC: Shadowy Pillar
-- A Moogle Kupo d'Etat 13: A Challenge! You Could Be a Winner
-- !pos 373 -12 -15
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local youCouldBeAWinner = player:getCurrentMission(AMK) == dsp.mission.id.amk.A_CHALLENGE_YOU_COULD_BE_A_WINNER
    local gauntletCoupon = player:hasKeyItem(dsp.ki.GAUNTLET_CHALLENGE_KUPON)

    if youCouldBeAWinner and gauntletCoupon then
        player:startEvent(100, 1)
    elseif youCouldBeAWinner and player:getVar("AMK") == 0 then
        player:PrintToPlayer("Missing event, proceed to Beaucedine Glacier")
        player:setVar("AMK", 1)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 100 and option == 1 then
        -- start the race
        player:PrintToPlayer("Run to Flame of Fate...")
    end
end

-----------------------------------
-- Area: Jugner Forest (S)
--  NPC: Helmyre
-- Type: Chocobo Renter
-- !pos -120.853 0.000 -152.582 82
-----------------------------------
package.loaded["scripts/zones/Jugner_Forest_[S]/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Jugner_Forest_[S]/TextIDs")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/chocobo")
require("scripts/globals/status")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local level = player:getMainLvl()
    local notes = player:getCurrency("allied_notes")

    if player:hasKeyItem(dsp.ki.CHOCOBO_LICENSE) and level >= 20 and player:hasCompletedMission(WOTG,BACK_TO_THE_BEGINNING) then
        local price = getChocoboPrice(player)
        player:setLocalVar("chocoboPriceOffer",price)

        player:startEvent(208,price,notes)
    else
        player:startEvent(209)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    local price = player:getLocalVar("chocoboPriceOffer")

    if csid == 208 and option == 0 then
        player:delCurrency("allied_notes", price)
        updateChocoboPrice(player, price)

        local duration = 1800 + (player:getMod(dsp.mod.CHOCOBO_RIDING_TIME) * 60)

        player:addStatusEffectEx(dsp.effect.MOUNTED,dsp.effect.MOUNTED,0,0,duration,true)
    end
end
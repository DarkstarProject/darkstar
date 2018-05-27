-----------------------------------
-- Area: Pashhow Marshlands [S]
--  NPC: Milloure
-- Type: Chocobo Renter
-- !pos 336.765 24.416 -124.592 90
-----------------------------------
package.loaded["scripts/zones/Pashhow_Marshlands_[S]/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Pashhow_Marshlands_[S]/TextIDs")
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

        player:startEvent(103,price,notes)
    else
        player:startEvent(104)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    local price = player:getLocalVar("chocoboPriceOffer")

    if csid == 103 and option == 0 then
        player:delCurrency("allied_notes", price)
        updateChocoboPrice(player, price)

        local duration = 1800 + (player:getMod(dsp.mod.CHOCOBO_RIDING_TIME) * 60)

        player:addStatusEffectEx(dsp.effect.MOUNTED,dsp.effect.MOUNTED,0,0,duration,true)
    end
end
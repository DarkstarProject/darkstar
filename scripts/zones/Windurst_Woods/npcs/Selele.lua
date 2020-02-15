-----------------------------------
-- Area: Windurst Woods
--  NPC: Selele
-- Type: Tutorial NPC
-- !pos 106.9 -5 -31.5 241
-----------------------------------
local ID = require("scripts/zones/Windurst_Woods/IDs")
require("scripts/globals/status")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/npc_util")
-----------------------------------


function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local tutorial = player:getCharVar("TutorialProgress")
    if tutorial == 11 then
        player:startEvent(830)
    else
        local isSkilled = false
        local mLevel = player:getMainLvl()
        local hasCrystal = player:hasKeyItem(tpz.ki.MEA_GATE_CRYSTAL)
        if tutorial == 3 then
            for i = 1, 12 do
                if player:getSkillLevel(i) >= 5 then
                    isSkilled = true
                    break
                end
            end
        end
        if tutorial == 0 or tutorial == nil then
            player:startEvent(813)
        elseif tutorial == 1 then
            if not player:hasStatusEffect(tpz.effect.SIGNET) then
                player:startEvent(814)
            else
                player:startEvent(815)
            end
        elseif tutorial == 2 then
            if not player:hasStatusEffect(tpz.effect.FOOD) then
                player:startEvent(816)
            else
                player:startEvent(817)
            end
        elseif tutorial == 3 then
            if not isSkilled then
                player:startEvent(818)
            else
                player:startEvent(819)
            end
        elseif tutorial == 4 then
            player:startEvent(820)
        elseif tutorial == 5 then
            player:startEvent(821)
        elseif tutorial == 6 then
            if mLevel < 4 then
                player:startEvent(822)
            else
                player:startEvent(823, 0, 0, 2, 0, 0, 0, 0, 0)
            end
        elseif tutorial == 7 then
            player:startEvent(824, 0, 0, 2, 0, 0, 0, 0, 0)
        elseif tutorial == 8 then
            player:startEvent(825, 1500, 0, 2, 0, 0, 0, 0, 0)
        elseif tutorial == 9 then
            if mLevel < 10 then
                player:startEvent(826, 0, 0, 2, 0, 0, 0, 0, 0)
            else
                player:startEvent(827, 0, 1000, 2, 0, 0, 0, 0, 0)
            end
        elseif tutorial == 10 then
            if not hasCrystal then
                player:startEvent(828, tpz.ki.MEA_GATE_CRYSTAL, 0, 2, 0, 0, 0, 0, 0)
            else
                player:startEvent(829, tpz.ki.MEA_GATE_CRYSTAL, 2500, 1789, 3, 0, 0, 0, 0)
            end
        end
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 813 then
        player:setCharVar("TutorialProgress", 1)
    elseif csid == 815 then
        player:setCharVar("TutorialProgress", 2)
        player:addItem(4376, 6)
        player:messageSpecial(ID.text.ITEM_OBTAINED, 4376)
    elseif csid == 817 then
        player:setCharVar("TutorialProgress", 3)
    elseif csid == 819 then
        npcUtil.giveItem(player, {{4101, 1}, {4570, 1}, {4370, 1}})
        player:setCharVar("TutorialProgress", 4)
    elseif csid == 821 then
        player:addKeyItem(tpz.ki.CONQUEST_PROMOTION_VOUCHER)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.CONQUEST_PROMOTION_VOUCHER)
        player:setCharVar("TutorialProgress", 6)
    elseif csid == 823 then
        player:addItem(16003)
        player:messageSpecial(ID.text.ITEM_OBTAINED, 16003)
        player:setCharVar("TutorialProgress", 7)
    elseif csid == 825 then
        player:addExp(1200)
        player:setCharVar("TutorialProgress", 9)
    elseif csid == 827 then
        player:addGil(1000)
        player:messageSpecial(ID.text.GIL_OBTAINED, 1000)
        player:setCharVar("TutorialProgress", 10)
    elseif csid == 829 then
        player:addExp(2500)
        npcUtil.giveItem(player, {1789, 3})
        player:setCharVar("TutorialProgress", 11)
    end
end
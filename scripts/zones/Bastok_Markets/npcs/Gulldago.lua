-----------------------------------
-- Area: Bastok Markets
--  NPC: Gulldago
-- Type: Tutorial NPC
-- !pos -364.121 -11.034 -167.456 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs")
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
        player:startEvent(535)
    else
        local isSkilled = false
        local mLevel = player:getMainLvl()
        local hasCrystal = player:hasKeyItem(tpz.ki.DEM_GATE_CRYSTAL)
        if tutorial == 3 then
            for i = 1, 12 do
                if player:getSkillLevel(i) >= 5 then
                    isSkilled = true
                    break
                end
            end
        end
        if tutorial == 0 or tutorial == nil then
            player:startEvent(518)
        elseif tutorial == 1 then
            if not player:hasStatusEffect(tpz.effect.SIGNET) then
                player:startEvent(519)
            else
                player:startEvent(520)
            end
        elseif tutorial == 2 then
            if not player:hasStatusEffect(tpz.effect.FOOD) then
                player:startEvent(521)
            else
                player:startEvent(522)
            end
        elseif tutorial == 3 then
            if not isSkilled then
                player:startEvent(523)
            else
                player:startEvent(524)
            end
        elseif tutorial == 4 then
            player:startEvent(525)
        elseif tutorial == 5 then
            player:startEvent(526)
        elseif tutorial == 6 then
            if mLevel < 4 then
                player:startEvent(527)
            else
                player:startEvent(528, 0, 0, 1, 0, 0, 0, 0, 0)
            end
        elseif tutorial == 7 then
            player:startEvent(529, 0, 0, 1, 0, 0, 0, 0, 0)
        elseif tutorial == 8 then
            player:startEvent(530, 1500, 0, 1, 0, 0, 0, 0, 0)
        elseif tutorial == 9 then
            if mLevel < 10 then
                player:startEvent(531, 0, 0, 1, 0, 0, 0, 0, 0)
            else
                player:startEvent(532, 0, 1000, 1, 0, 0, 0, 0, 0)
            end
        elseif tutorial == 10 then
            if not hasCrystal then
                player:startEvent(533, tpz.ki.DEM_GATE_CRYSTAL, 0, 1, 0, 0, 0, 0, 0)
            else
                player:startEvent(534, tpz.ki.DEM_GATE_CRYSTAL, 2500, 1789, 3, 0, 0, 0, 0)
            end
        end
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 518 then
        player:setCharVar("TutorialProgress", 1)
    elseif csid == 520 then
        player:setCharVar("TutorialProgress", 2)
        player:addItem(4376, 6)
        player:messageSpecial(ID.text.ITEM_OBTAINED, 4376)
    elseif csid == 522 then
        player:setCharVar("TutorialProgress", 3)
    elseif csid == 524 then
        npcUtil.giveItem(player, {{4096, 1}, {926, 1}, {4370, 1}})
        player:setCharVar("TutorialProgress", 4)
    elseif csid == 526 then
        player:addKeyItem(tpz.ki.CONQUEST_PROMOTION_VOUCHER)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.CONQUEST_PROMOTION_VOUCHER)
        player:setCharVar("TutorialProgress", 6)
    elseif csid == 528 then
        player:addItem(16003)
        player:messageSpecial(ID.text.ITEM_OBTAINED, 16003)
        player:setCharVar("TutorialProgress", 7)
    elseif csid == 530 then
        player:addExp(1200)
        player:setCharVar("TutorialProgress", 9)
    elseif csid == 532 then
        player:addGil(1000)
        player:messageSpecial(ID.text.GIL_OBTAINED, 1000)
        player:setCharVar("TutorialProgress", 10)
    elseif csid == 534 then
        player:addExp(2500)
        npcUtil.giveItem(player, {1789, 3})
        player:setCharVar("TutorialProgress", 11)
    end
end

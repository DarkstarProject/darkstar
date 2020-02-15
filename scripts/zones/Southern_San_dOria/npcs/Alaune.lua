-----------------------------------
-- Area: Southern San d`Oria
--   NPC: Alaune
-- Type: Tutorial NPC
-- !pos -90 1 -56 230
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/status")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/npc_util")
-----------------------------------


function onTrade(player, npc, trade)
    -- "Flyers for Regine" conditional script
    local FlyerForRegine = player:getQuestStatus(SANDORIA, tpz.quest.id.sandoria.FLYERS_FOR_REGINE)

    if FlyerForRegine == 1 then
        local count = trade:getItemCount()
        local MagicFlyer = trade:hasItemQty(532, 1)
        if MagicFlyer and (count == 1) then
            player:messageSpecial(ID.text.FLYER_REFUSED)
        end
    end
end

function onTrigger(player, npc)
    local tutorial = player:getCharVar("TutorialProgress")
    if tutorial == 11 then
        player:startEvent(933)
    else
        local isSkilled = false
        local mLevel = player:getMainLvl()
        local hasCrystal = player:hasKeyItem(tpz.ki.HOLLA_GATE_CRYSTAL)
        if tutorial == 3 then
            for i = 1, 12 do
                if player:getSkillLevel(i) >= 5 then
                    isSkilled = true
                    break
                end
            end
        end
        if tutorial == 0 or tutorial == nil then
            player:startEvent(916)
        elseif tutorial == 1 then
            if not player:hasStatusEffect(tpz.effect.SIGNET) then
                player:startEvent(917)
            else
                player:startEvent(918)
            end
        elseif tutorial == 2 then
            if not player:hasStatusEffect(tpz.effect.FOOD) then
                player:startEvent(919)
            else
                player:startEvent(920)
            end
        elseif tutorial == 3 then
            if not isSkilled then
                player:startEvent(921)
            else
                player:startEvent(922)
            end
        elseif tutorial == 4 then
            player:startEvent(923)
        elseif tutorial == 5 then
            player:startEvent(924)
        elseif tutorial == 6 then
            if mLevel < 4 then
                player:startEvent(925)
            else
                player:startEvent(926, 0, 0, 0, 0, 0, 0, 0, 0)
            end
        elseif tutorial == 7 then
            player:startEvent(927, 0, 0, 0, 0, 0, 0, 0, 0)
        elseif tutorial == 8 then
            player:startEvent(928, 1500, 0, 0, 0, 0, 0, 0, 0)
        elseif tutorial == 9 then
            if mLevel < 10 then
                player:startEvent(929, 0, 0, 0, 0, 0, 0, 0, 0)
            else
                player:startEvent(930, 0, 1000, 0, 0, 0, 0, 0, 0)
            end
        elseif tutorial == 10 then
            if not hasCrystal then
                player:startEvent(931, tpz.ki.HOLLA_GATE_CRYSTAL, 0, 2, 0, 0, 0, 0, 0)
            else
                player:startEvent(932, tpz.ki.HOLLA_GATE_CRYSTAL, 2500, 1789, 3, 0, 0, 0, 0)
            end
        end
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 916 then
        player:setCharVar("TutorialProgress", 1)
    elseif csid == 918 then
        player:setCharVar("TutorialProgress", 2)
        player:addItem(4376, 6)
        player:messageSpecial(ID.text.ITEM_OBTAINED, 4376)
    elseif csid == 920 then
        player:setCharVar("TutorialProgress", 3)
    elseif csid == 922 then
        npcUtil.giveItem(player, {{4101, 1}, {936, 1}, {4358, 1}})
        player:setCharVar("TutorialProgress", 4)
    elseif csid == 924 then
        player:addKeyItem(tpz.ki.CONQUEST_PROMOTION_VOUCHER)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.CONQUEST_PROMOTION_VOUCHER)
        player:setCharVar("TutorialProgress", 6)
    elseif csid == 926 then
        player:addItem(16003)
        player:messageSpecial(ID.text.ITEM_OBTAINED, 16003)
        player:setCharVar("TutorialProgress", 7)
    elseif csid == 928 then
        player:addExp(1200)
        player:setCharVar("TutorialProgress", 9)
    elseif csid == 930 then
        player:addGil(1000)
        player:messageSpecial(ID.text.GIL_OBTAINED, 1000)
        player:setCharVar("TutorialProgress", 10)
    elseif csid == 932 then
        player:addExp(2500)
        npcUtil.giveItem(player, {1789, 3})
        player:setCharVar("TutorialProgress", 11)
    end
end
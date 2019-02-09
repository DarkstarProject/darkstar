-----------------------------------
-- Area: Qufim_Island
--  NPC: Hieroglyphics
-- Dynamis Qufim Entrance
-- !pos 16 -19 162 126
-----------------------------------
local ID = require("scripts/zones/Qufim_Island/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/settings")
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if (player:hasCompletedMission(COP, DARKNESS_NAMED) or FREE_COP_DYNAMIS == 1) and player:hasKeyItem(dsp.ki.VIAL_OF_SHROUDED_SAND) then
        local realDay = os.time()
        local dynaWaitxDay = player:getVar("dynaWaitxDay")
        local dynaUniqueID = GetServerVariable("[DynaQufim]UniqueID")

        if checkFirstDyna(player, 9) then
            player:startEvent(22)
        elseif player:getMainLvl() < DYNA_LEVEL_MIN then
            player:messageSpecial(ID.text.PLAYERS_HAVE_NOT_REACHED_LEVEL, DYNA_LEVEL_MIN)
        elseif (dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 3600)) < realDay or (player:getVar("DynamisID") == dynaUniqueID and dynaUniqueID > 0) then
            player:startEvent(3, 9, 0, 0, BETWEEN_2DYNA_WAIT_TIME, 32, dsp.ki.VIAL_OF_SHROUDED_SAND, 4236, 4237)
        else
            local dayRemaining = math.floor(((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 3600)) - realDay) / 3456)
            player:messageSpecial(ID.text.YOU_CANNOT_ENTER_DYNAMIS, dayRemaining, 8)
        end
    else
        player:messageSpecial(ID.text.MYSTERIOUS_VOICE)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 22 then
        if checkFirstDyna(player, 9) then
            player:setVar("Dynamis_Status", bit.bor(player:getVar("Dynamis_Status"), 512))
        end
    elseif csid == 3 and option == 0 then
        player:setVar("enteringDynamis", 1)
        player:setPos(-19, -17, 104, 253, 41)
    end
end
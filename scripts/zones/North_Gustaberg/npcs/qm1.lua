-----------------------------------
-- Area: North Gustaberg
--  NPC: qm1 (???)
-- Involved in Quest "The Siren's Tear"
-----------------------------------
local ID = require("scripts/zones/North_Gustaberg/IDs")
require("scripts/globals/quests")
require("scripts/globals/status")
-----------------------------------

local positions =
{
    [0] = {309.600, 2.600, 324.000}, -- starting position (from db)
    [1] = {290.000, 0.600, 332.100}, -- alternative starting position
    [2] = {296.000, 3.000, 220.000},
    [3] = {349.480, 3.300, 208.000},
    [4] = {332.100, 6.000, 150.100},
}

-- send the QM to one of the two northern starting locations
-- if it's already at one, send it to the other one
local function resetSirenTear(npc)
    local currentPos = npc:getLocalVar("pos")
    if currentPos == 0 then
        nextPos = 1
    elseif currentPos == 1 then
        nextPos = 0
    else
        nextPos = math.random(2) - 1
    end
    npc:setLocalVar("pos", nextPos)
    npc:setPos(unpack(positions[nextPos]))
end

-- move the QM downstream (south)
-- if it's at the southern end, reset it to one of the two starting positions
local function moveSirenTear(npc)
    local currentPos = npc:getLocalVar("pos")
    if currentPos == 4 then
        resetSirenTear(npc)
    else
        nextPos = (currentPos == 0) and 2 or (currentPos + 1)
        npc:setLocalVar("pos", nextPos)
        npc:setPos(unpack(positions[nextPos]))
    end
end

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    player:startEvent(10)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 10 and option == 0 then
        local npc = player:getEventTarget()

        if player:getEquipID(dsp.slot.MAIN) == 0 and player:getEquipID(dsp.slot.SUB) == 0 then
            if player:hasItem(576) then
                player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED_TWICE, 576)
            elseif npcUtil.giveItem(player, 576) then
                resetSirenTear(npc)
            end
        else
            player:messageSpecial(ID.text.SHINING_OBJECT_SLIPS_AWAY)
            moveSirenTear(npc)
        end
    end
end

-----------------------------------
-- Area:  Nyzul Isle
-- NPC:   Rune of Transfer
-- Notes: Displays current floor objective, activates when objective completed.
-----------------------------------
local ID = require("scripts/zones/Nyzul_Isle/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/status")
require("scripts/zones/Nyzul_Isle/instances/nyzul_isle_investigation")
require("scripts/zones/Nyzul_Isle/globals")
-----------------------------------

function onTrigger(player, npc)
    local instance = npc:getInstance()

    if npc:AnimationSub() == 1 then
        player:startEvent(201, 7, 2, 5348, 5348, 5348, 5348, 5348, 5348)
    end
    if npc:AnimationSub() == 0 then
        player:messageSpecial(ID.text.ELIMINATE_ENEMY_LEADER + instance:getStage())
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option, npc)
    local instance = player:getInstance()
    local RUNE = instance:getEntity(bit.band(ID.npc.RUNE_TRANSFER_START, 0xFFF), dsp.objType.NPC)
    local START = RUNE:getLocalVar("Nyzul_Isle_StartingFloor")
    local CURRENT = RUNE:getLocalVar("Nyzul_Current_Floor")
    local chars = instance:getChars()
    local SIZE = player:getPartySize()
    local COMPLETED = 0
    local TOKENS = 0

    if csid == 201 and option == 2 then
        npc:AnimationSub(0)
        for i = ID.mob[51].ARCHAIC_RAMPART1, ID.mob[51].CERBERUS do
            DespawnMob(i, instance)
        end
        RUNE:setLocalVar("Nyzul_Current_Floor", RUNE:getLocalVar("Nyzul_Current_Floor") + 1)
        for i,v in pairs(chars) do
            v:startEvent(95)
        end
        pickSetPoint(player)
    elseif csid == 201 and option == 1 then
        if (CURRENT - START >= 5) and (CURRENT - START <= 9) then
            COMPLETED = 5
        elseif (CURRENT - START >= 10) and (CURRENT - START <= 14) then
            COMPLETED = 10
        elseif (CURRENT - START >= 15) and (CURRENT - START <= 19) then
            COMPLETED = 15
        elseif (CURRENT - START >= 20) and (CURRENT - START <= 24) then
            COMPLETED = 20
        end
        if SIZE <= 3 then
            TOKENS = ((CURRENT - START)*200 + (CURRENT * 10))
        else
            TOKENS = ((CURRENT - START)*200 + (CURRENT * 10)) * (((13 - SIZE)*10)/100)
        end
        for i,v in pairs(chars) do
            if (v:getVar("NyzulFloorProgress") + 1) >= START and v:getVar("NyzulFloorProgress") < CURRENT then
                v:setVar("NyzulFloorProgress", CURRENT)
            end
            v:addCurrency("nyzul_isle_assault_point", TOKENS)
            v:messageSpecial(ID.text.OBTAIN_TOKENS, TOKENS)
            v:startEvent(1)
        end
    elseif csid == 1 then
        player:setPos(0,0,0,0,72)
    end
end
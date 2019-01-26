-----------------------------------
-- Area: Toraimarai Canal
--  NPC: ???
-- Involved In Quest: Wild Card
-- !pos -95 16 -31 169
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if player:getVar("rootProblem") == 2 then
        if player:getVar("rootProblemQ2") <= 1 then
            if player:hasStatusEffect(dsp.effect.MANAFONT) then
                player:startEvent(47)
            else
                player:startEvent(46)
            end
        else
            player:startEvent(42)
        end
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 47 then
        player:setVar("rootProblemQ2", 2)
    end
end

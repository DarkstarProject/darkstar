-----------------------------------
-- Area: Toraimarai Canal
--  NPC: ???
-- Involved In Quest: Wild Card
-- !pos -95 16 -31 169
-----------------------------------
package.loaded["scripts/zones/Toraimarai_Canal/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/treasure");
require("scripts/globals/quests");
require("scripts/zones/Toraimarai_Canal/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)
    if (player:getVar("rootProblem") == 2) then
        if (player:getVar("rootProblemQ2") <= 1) then
            if (player:hasStatusEffect(EFFECT_MANAFONT) == true) then
                player:startEvent(47);
            else
                player:startEvent(46);
            end
        else
            player:startEvent(42);
        end
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);

end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 47) then
        player:setVar("rootProblemQ2",2);
    end
end;



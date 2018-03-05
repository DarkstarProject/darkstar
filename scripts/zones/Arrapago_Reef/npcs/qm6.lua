-----------------------------------
-- Area: Arrapago Reef
--  NPC: ??? (corsair job flag quest)
--
-----------------------------------
package.loaded["scripts/zones/Arrapago_Reef/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Arrapago_Reef/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    LuckOfTheDraw = player:getVar("LuckOfTheDraw");

    if (LuckOfTheDraw ==2) then
        player:startEvent(211);
        player:setVar("LuckOfTheDraw",3);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
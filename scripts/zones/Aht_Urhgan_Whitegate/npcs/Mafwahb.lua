-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Mafwahb
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local LuckOfTheDraw = player:getVar("LuckOfTheDraw");

    if (LuckOfTheDraw ==1) then
        player:startEvent(548);
        player:setVar("LuckOfTheDraw",2);
    else
        player:startEvent(647);
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


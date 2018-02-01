-----------------------------------
-- Area: Talacca_Cove
--  NPC: ??? (corsair job flag quest)
--
-----------------------------------
package.loaded["scripts/zones/Talacca_Cove/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Talacca_Cove/TextIDs");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    LuckOfTheDraw = player:getVar("LuckOfTheDraw");

    if (LuckOfTheDraw ==3) then
        player:startEvent(2);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 2) then
        player:setVar("LuckOfTheDraw",4);
        player:addKeyItem(FORGOTTEN_HEXAGUN);
        player:messageSpecial(KEYITEM_OBTAINED,FORGOTTEN_HEXAGUN);
    end

end;
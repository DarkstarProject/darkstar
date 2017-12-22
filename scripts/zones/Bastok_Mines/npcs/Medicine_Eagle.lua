-----------------------------------
-- Area: Bastok Mines
-- NPC: Medicine Eagle
-- Involved in Mission: Bastok 6-1, 8-1
-- !pos -40 0 38 234
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;
-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getCurrentMission(BASTOK) == RETURN_OF_THE_TALEKEEPER and player:getVar("MissionStatus") == 0) then
        player:startEvent(180);
    else
        player:startEvent(25);
    end

end;

-- if Bastok Mission 8-1
-- 0x00b0
-- player:startEvent(180);
-- player:startEvent(181);
--0x0001  25  0x00b0  181  180

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 180) then
        player:setVar("MissionStatus",1);
    end

end;
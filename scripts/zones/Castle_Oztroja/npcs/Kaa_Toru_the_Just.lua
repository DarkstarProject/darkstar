-----------------------------------
--  Area: Castle Oztroja
--  NPC:  Kaa Toru the Just
--  Type: Mission NPC [ Windurst Mission 6-2 NPC ]~
-- !pos -100.188 -62.125 145.422 151
-----------------------------------
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Castle_Oztroja/TextIDs");
require("scripts/globals/keyitems");

-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getCurrentMission(WINDURST) == SAINTLY_INVITATION and player:getVar("MissionStatus") == 2) then
        player:startEvent(45,0,200);
    else
        player:startEvent(46);
    end
end;

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
    if (csid == 45) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13134);
        else
            player:delKeyItem(HOLY_ONES_INVITATION);
            player:addKeyItem(HOLY_ONES_OATH);
            player:messageSpecial(KEYITEM_OBTAINED,HOLY_ONES_OATH);
            player:addItem(13134); -- Ashura Necklace
            player:messageSpecial(ITEM_OBTAINED,13134);
            player:setVar("MissionStatus",3);
        end
    end
end;


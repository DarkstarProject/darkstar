-----------------------------------
--
-- Zone: The_Shrouded_Maw (10)
--
-----------------------------------
package.loaded["scripts/zones/The_Shrouded_Maw/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/The_Shrouded_Maw/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-300,-1.5,-220,62);
    end
    if (player:getCurrentMission(COP) == DARKNESS_NAMED  and  player:getVar("PromathiaStatus") == 1) then
        cs =0x0002;
    end
    return cs;
end;

-----------------------------------
-- onConquestUpdate
-----------------------------------

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
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
    if (csid == 0x0002) then
        player:setVar("PromathiaStatus",2);
    end
end;
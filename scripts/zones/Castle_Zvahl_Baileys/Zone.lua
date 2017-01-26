-----------------------------------
--
-- Zone: Castle_Zvahl_Baileys (161)
--
-----------------------------------
package.loaded["scripts/zones/Castle_Zvahl_Baileys/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/zone");
require("scripts/zones/Castle_Zvahl_Baileys/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1, -90,17,45, -84,19,51);  -- map 4 NW porter
    zone:registerRegion(1, 17,-90,45, -85,18,51);  -- map 4 NW porter
    zone:registerRegion(2, -90,17,-10, -85,18,-5);  -- map 4 SW porter
    zone:registerRegion(3, -34,17,-10, -30,18,-5);  -- map 4 SE porter
    zone:registerRegion(4, -34,17,45, -30,18,51);  -- map 4 NE porter

    -- Marquis Allocen
    SetRespawnTime(17436913, 900, 10800);

    -- Marquis Amon
    SetRespawnTime(17436918, 900, 10800);

    -- Duke Haborym
    SetRespawnTime(17436923, 900, 10800);

    -- Grand Duke Batym
    SetRespawnTime(17436927, 900, 10800);

    UpdateTreasureSpawnPoint(17436997);
    UpdateTreasureSpawnPoint(17436998);
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
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-181.969,-35.542,19.995,254);
    end
    return cs;
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)

    switch (region:GetRegionID()): caseof
    {
        ---------------------------------
        [1] = function (x)  --
        ---------------------------------
            player:startEvent(0x0003); -- ports player to NW room of map 3
        end,

        ---------------------------------
        [2] = function (x)  --
        ---------------------------------
            player:startEvent(0x0002); -- ports player to SW room of map 3
        end,

        ---------------------------------
        [3] = function (x)  --
        ---------------------------------
            player:startEvent(0x0001); -- ports player to SE room of map 3
        end,

        ---------------------------------
        [4] = function (x)  --
        ---------------------------------
            player:startEvent(0x0000); -- ports player to NE room of map 3
        end,

        default = function (x)
        --print("default");
        end,
    }

end;

-----------------------------------
-- onRegionLeave
-----------------------------------

function onRegionLeave(player,region)
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
end;
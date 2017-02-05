-----------------------------------
--
-- Zone: Attohwa_Chasm (7)
--
-----------------------------------
package.loaded["scripts/zones/Attohwa_Chasm/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/zone");
require("scripts/zones/Attohwa_Chasm/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    -- Poison Flowers!
    zone:registerRegion(1, -475.809, 5, 316.499, 0,0,0);
    zone:registerRegion(2, -440.938, 7, 281.749, 0,0,0);
    zone:registerRegion(3, -388.027, 5, 264.831, 0,0,0);
    zone:registerRegion(4, -534.104, 5, 217.833, 0,0,0);
    zone:registerRegion(5, -530.000, 5, 210.000, 0,0,0);
    zone:registerRegion(6, -482.192, 5, 198.647, 0,0,0);
    zone:registerRegion(7, -595.756, 7, 157.532, 0,0,0);
    zone:registerRegion(8, -514.000, 5, 166.000, 0,0,0);
    zone:registerRegion(9, -396.844, 5, 164.790, 0,0,0);
    zone:registerRegion(10, -382.919, 5, 143.572, 0,0,0);
    zone:registerRegion(11, -537.558, 5, 102.683, 0,0,0);
    zone:registerRegion(12, -393.979, 5, 101.877, 0,0,0);
    zone:registerRegion(13, -367.892, 5, 75.774, 0,0,0);
    zone:registerRegion(14, -369.333, 5, 69.333, 0,0,0);
    zone:registerRegion(15, -351.717, 5, 64.773, 0,0,0);
    zone:registerRegion(16, -386.000, 5, 50.000, 0,0,0);
    zone:registerRegion(17, -360.705, 5, 51.505, 0,0,0);
    zone:registerRegion(18, -475.667, 5, 37.081, 0,0,0);
    zone:registerRegion(19, -321.902, 5, 36.697, 0,0,0);
    zone:registerRegion(20, -351.916, 5, 10.501, 0,0,0);
    zone:registerRegion(21, -554.739, 5, -3.057, 0,0,0);
    zone:registerRegion(22, -397.667, 5, -5.563, 0,0,0);
    zone:registerRegion(23, -330.062, 5, -18.832, 0,0,0);
    zone:registerRegion(24, -233.015, 5, -19.049, 0,0,0);
    zone:registerRegion(25, -553.523, 5, -72.071, 0,0,0);
    zone:registerRegion(26, -535.904, 7, -67.914, 0,0,0);
    zone:registerRegion(27, -435.438, 5, -74.171, 0,0,0);
    zone:registerRegion(28, -369.343, 5, -73.449, 0,0,0);
    zone:registerRegion(29, -238, 5, -118, 0,0,0);
    zone:registerRegion(30, -385.349, 5, -173.973, 0,0,0);

    -- Tiamat
    SetRespawnTime(16806227, 86400, 259200);
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-194.487,-13.766,338.704,141);
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
    local Gasponia_Offset = 16806299;

    if (region:GetRegionID() <= 30) then
    -- TODO: Gasponia's shouldn't "always" poison you. However, in retail regions constantly reapply themselves without having to re-enter the region. In DSP that doesn't happen so I'm leaving it as-is for now.
        for i = 0, 30, 1 do
            if (region:GetRegionID() == i) then
            local Gasponia_Offset = Gasponia_Offset + (i -1);
                GetNPCByID(Gasponia_Offset):openDoor(3);
                -- print("i is "..i);
            -- printf("Player is: %s | Flower ID is: %i",player:getName(), Gasponia_Offset);
            end
        end

        if (player:hasStatusEffect(EFFECT_POISON) == false) then
            player:messageSpecial(GASPONIA_POISON);
            local duration = math.random(30,60);
            player:addStatusEffect(EFFECT_POISON, 15, 0, duration);
        end
    end
end;

-----------------------------------
-- onRegionLeave
-----------------------------------

function onRegionLeave(player,region)
end;

-----------------------------------
-- onGameHour
-----------------------------------

function onGameHour()
    local npc = GetNPCByID(16806283);
    if (npc ~= nil) then
        npc:openDoor(); -- Attohwa Chasm miasma
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
end;
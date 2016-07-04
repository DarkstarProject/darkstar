-----------------------------------
--
-- Zone: PsoXja (9)
--
-----------------------------------
package.loaded["scripts/zones/PsoXja/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/zones/PsoXja/TextIDs");
require("scripts/globals/missions");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1,-21.469,27.000,-24.255, -18.723,32.000,-19.877); -- 40 cap (H-8 Tower)
    zone:registerRegion(2, 337.376,27,-19.836, 342.340,32,-16.055); -- 50 cap area (J-8 Tower)
    zone:registerRegion(3, 95.659,42,-302.390, 99.973,48,-297.744); -- 60 cap area (H-10 Tower)
    zone:registerRegion(4, -384.452,26,257.961, -379.945,32,262.558); -- Uncapped area 1 (F-7 Tower)
    zone:registerRegion(5, -302.493,42,-179.995, -297.386,48,-176.078); -- Uncapped area 2 (G-9 Tower)
    zone:registerRegion(6, 299.847,42, 257.716, 303.824,48,262.391); -- Uncapped area 3 (I-7 Tower)
    
    UpdateTreasureSpawnPoint(16814557);
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
    local playerX = player:getXPos();

    if ((playerX == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        player:setPos(-29.956,-1.903,212.521,188);
    end
    if (ENABLE_COP_ZONE_CAP == 1) then
        local LVLcap = player:getVar("PSOXJA_RESTRICTION_LVL");
        if (LVLcap > 0) then
            player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,LVLcap,0,0);-- ZONE LEVEL RESTRICTION
        end
     end
    if (playerX == -300 and player:getCurrentMission(COP) == THE_ENDURING_TUMULT_OF_WAR and player:getVar("PromathiaStatus")==2) then
        cs = 0x0001; -- COP event
    elseif (playerX == 220 and player:getCurrentMission(COP) == THREE_PATHS and player:getVar("COP_Tenzen_s_Path") == 8) then
        cs = 0x0004;
    end
    return cs;
end;

-----------------------------------
-- afterZoneIn
-----------------------------------

function afterZoneIn(player)
    player:entityVisualPacket("brmp");
    player:entityVisualPacket("lirp");
    player:entityVisualPacket("kil1");
    player:entityVisualPacket("kil2");
    player:entityVisualPacket("kil3");
    player:entityVisualPacket("saa1");
    player:entityVisualPacket("saa2");
    player:entityVisualPacket("saa3");
    player:entityVisualPacket("byc1");
    player:entityVisualPacket("byc2");
    player:entityVisualPacket("byc3");
    player:entityVisualPacket("byc4");
    player:entityVisualPacket("byc5");
    player:entityVisualPacket("byc6");
    player:entityVisualPacket("byc7");
    player:entityVisualPacket("byc8");
    player:entityVisualPacket("s123");
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)

    if (region:GetRegionID() == 1) then
        player:startEvent(0x0014);
    elseif (region:GetRegionID() == 2) then
        player:startEvent(0x0015);
    elseif (region:GetRegionID() == 3) then
        player:startEvent(0x0016);
    elseif (region:GetRegionID() == 4) then
        player:startEvent(0x0017);
    elseif (region:GetRegionID() == 5) then
        player:startEvent(0x0018);
    elseif (region:GetRegionID() == 6) then
        player:startEvent(0x0019);
    end    
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
    --printf("CSID: %u",csid);
    --printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0001) then
      player:setVar("PromathiaStatus",3);
    elseif (csid == 0x0004) then
      player:setVar("COP_Tenzen_s_Path",9);
    elseif (csid == 0x0014 and option == 1) then
        player:setPos(-20,-60.250,-60,63,111);
    elseif (csid == 0x0015 and option == 1) then
        player:setPos(260,-0.25,-20,254,111);
    elseif (csid == 0x0016 and option == 1) then
        player:setPos(60,-0.250,-340.000,190,111);
    elseif (csid == 0x0017 and option == 1) then
        player:setPos(-340,-100.250,140,63,111);
    elseif (csid == 0x0018 and option == 1) then
        player:setPos(-180,-40.25 ,-220,0,111);
    elseif (csid == 0x0019 and option == 1) then
        player:setPos(100,-20.25,140,64,111);
    end
end;

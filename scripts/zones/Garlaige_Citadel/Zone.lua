-----------------------------------
--
-- Zone: Garlaige_Citadel (200)
--
-----------------------------------
package.loaded["scripts/zones/Garlaige_Citadel/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/zone");
require("scripts/zones/Garlaige_Citadel/TextIDs");

banishing_gates_base = 17596761; -- _5k0 (First banishing gate)

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    -- Banishing Gate #1...
    zone:registerRegion(1,-208,-1,224,-206,1,227);
    zone:registerRegion(2,-208,-1,212,-206,1,215);
    zone:registerRegion(3,-213,-1,224,-211,1,227);
    zone:registerRegion(4,-213,-1,212,-211,1,215);
    -- Banishing Gate #2
    zone:registerRegion(10,-51,-1,82,-49,1,84);
    zone:registerRegion(11,-151,-1,82,-149,1,84);
    zone:registerRegion(12,-51,-1,115,-49,1,117);
    zone:registerRegion(13,-151,-1,115,-149,1,117);
    -- Banishing Gate #3
    zone:registerRegion(19,-190,-1,355,-188,1,357);
    zone:registerRegion(20,-130,-1,355,-128,1,357);
    zone:registerRegion(21,-190,-1,322,-188,1,324);
    zone:registerRegion(22,-130,-1,322,-128,1,324);

    -- Old Two-Wings
    SetRespawnTime(17596506, 900, 10800);

    -- Skewer Sam
    SetRespawnTime(17596507, 900, 10800);

    -- Serket
    SetRespawnTime(17596720, 900, 10800);

    UpdateTreasureSpawnPoint(17596812);

    UpdateTreasureSpawnPoint(17596813);

end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;

    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        player:setPos(-380.035,-13.548,398.032,64);
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

    local regionID = region:GetRegionID();
    local mylever = banishing_gates_base + regionID;
    GetNPCByID(mylever):setAnimation(8);

    if (regionID >= 1 and regionID <= 4) then
        gateid = banishing_gates_base;
        msg_offset = 0;
    elseif (regionID >= 10 and regionID <= 13) then
        gateid = banishing_gates_base + 9;
        msg_offset = 1;
    elseif (regionID >= 19 and regionID <= 22) then
        gateid = banishing_gates_base + 18;
        msg_offset = 2;
    end;

    -- Open Gate
    gate1 = GetNPCByID(gateid + 1);
    gate2 = GetNPCByID(gateid + 2);
    gate3 = GetNPCByID(gateid + 3);
    gate4 = GetNPCByID(gateid + 4);

    if (gate1:getAnimation() == 8 and gate2:getAnimation() == 8 and gate3:getAnimation() == 8 and gate4:getAnimation() == 8) then
        player:messageSpecial(BANISHING_GATES + msg_offset); -- Banishing gate opening
        GetNPCByID(gateid):openDoor(30);
    end

end;

-----------------------------------
-- onRegionLeave
-----------------------------------

function onRegionLeave(player,region)

    local regionID = region:GetRegionID();
    local mylever = banishing_gates_base + regionID;
    GetNPCByID(mylever):setAnimation(9);

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
    --printf("CSID: %u",csid);
    --printf("RESULT: %u",option);
end;
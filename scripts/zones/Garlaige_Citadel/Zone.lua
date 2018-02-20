-----------------------------------
--
-- Zone: Garlaige_Citadel (200)
--
-----------------------------------
package.loaded["scripts/zones/Garlaige_Citadel/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Garlaige_Citadel/TextIDs");
require("scripts/zones/Garlaige_Citadel/MobIDs");
require("scripts/globals/conquest");
require("scripts/globals/zone");
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

    UpdateNMSpawnPoint(OLD_TWO_WINGS);
    GetMobByID(OLD_TWO_WINGS):setRespawnTime(math.random(900, 10800));

    UpdateNMSpawnPoint(SKEWER_SAM);
    GetMobByID(SKEWER_SAM):setRespawnTime(math.random(900, 10800));

    UpdateNMSpawnPoint(SERKET);
    GetMobByID(SERKET):setRespawnTime(math.random(900, 10800));

    UpdateTreasureSpawnPoint(17596812);
    UpdateTreasureSpawnPoint(17596813);
end;

function onZoneIn(player,prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-380.035,-13.548,398.032,64);
    end

    return cs;

end;

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

function onRegionEnter(player,region)
    local gateid;
    local regionID = region:GetRegionID();
    local mylever = BANISHING_GATE_OFFSET + regionID;
    GetNPCByID(mylever):setAnimation(8);

    if (regionID >= 1 and regionID <= 4) then
        gateid = BANISHING_GATE_OFFSET;
        msg_offset = 0;
    elseif (regionID >= 10 and regionID <= 13) then
        gateid = BANISHING_GATE_OFFSET + 9;
        msg_offset = 1;
    elseif (regionID >= 19 and regionID <= 22) then
        gateid = BANISHING_GATE_OFFSET + 18;
        msg_offset = 2;
    end;

    -- Open Gate
    local gate1 = GetNPCByID(gateid + 1);
    local gate2 = GetNPCByID(gateid + 2);
    local gate3 = GetNPCByID(gateid + 3);
    local gate4 = GetNPCByID(gateid + 4);

    if (gate1:getAnimation() == 8 and gate2:getAnimation() == 8 and gate3:getAnimation() == 8 and gate4:getAnimation() == 8) then
        player:messageSpecial(BANISHING_GATES + msg_offset); -- Banishing gate opening
        GetNPCByID(gateid):openDoor(30);
    end

end;

function onRegionLeave(player,region)

    local regionID = region:GetRegionID();
    local mylever = BANISHING_GATE_OFFSET + regionID;
    GetNPCByID(mylever):setAnimation(9);

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
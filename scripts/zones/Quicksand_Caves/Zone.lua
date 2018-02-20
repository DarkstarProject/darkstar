-----------------------------------
--
-- Zone: Quicksand_Caves (208)
--
-----------------------------------
package.loaded["scripts/zones/Quicksand_Caves/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Quicksand_Caves/TextIDs");
require("scripts/zones/Quicksand_Caves/MobIDs");
require("scripts/globals/conquest");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/npc_util");
require("scripts/globals/status");

function onInitialize(zone)
    -- Weight Door System (RegionID, X, Radius, Z)
    zone:registerRegion(1, -15, 5, -60, 0,0,0);   -- 0x010D01EF Door
    zone:registerRegion(3, 15, 5,-180, 0,0,0);    -- 0x010D01F1 Door
    zone:registerRegion(5, -580, 5,-420, 0,0,0);  -- 0x010D01F3 Door
    zone:registerRegion(7, -700, 5,-420, 0,0,0);  -- 0x010D01F5 Door
    zone:registerRegion(9, -700, 5,-380, 0,0,0);  -- 0x010D01F7 Door
    zone:registerRegion(11, -780, 5,-460, 0,0,0); -- 0x010D01F9 Door
    zone:registerRegion(13, -820, 5,-380, 0,0,0); -- 0x010D01FB Door
    zone:registerRegion(15, -260, 5, 740, 0,0,0); -- 0x010D01FD Door
    zone:registerRegion(17, -340, 5, 660, 0,0,0); -- 0x010D01FF Door
    zone:registerRegion(19, -420, 5, 740, 0,0,0); -- 0x010D0201 Door
    zone:registerRegion(21, -340, 5, 820, 0,0,0); -- 0x010D0203 Door
    zone:registerRegion(23, -409, 5, 800, 0,0,0); -- 0x010D0205 Door
    zone:registerRegion(25, -400, 5, 670, 0,0,0); -- 0x010D0207 Door

    -- Hole in the Sand
    zone:registerRegion(30,495,-9,-817,497,-7,-815); -- E-11 (Map 2)
    zone:registerRegion(31,815,-9,-744,817,-7,-742); -- M-9 (Map 2)
    zone:registerRegion(32,215,6,-17,217,8,-15);     -- K-6 (Map 3)
    zone:registerRegion(33,-297,6,415,-295,8,417);   -- E-7 (Map 6)
    zone:registerRegion(34,-137,6,-177,-135,8,-175); -- G-7 (Map 8)

    SetServerVariable("BastokFight8_1" ,0);
    SetServerVariable("Bastok8-1LastClear", os.time() - QM_RESET_TIME); -- Set a delay on ??? mission NM pop.

    UpdateTreasureSpawnPoint(QC_TREASURE_COFFER);

    npcUtil.UpdateNPCSpawnPoint(ANTICAN_TAG_QM, 60, 120, ANTICAN_TAG_POSITIONS, "[POP]Antican_Tag");
end;

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();
    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-980.193,14.913,-282.863,60);
    end
    return cs;
end;

function getWeight(player)
    local race = player:getRace();
    if (race == 8) then -- Galka
        return 3;
    elseif (race == 5 or race == 6) then -- Taru male or female
        return 1;
    else -- Hume/Elvaan/Mithra
        return 2;
    end
end;

function onRegionEnter(player,region)
    local RegionID = region:GetRegionID();

    -- holes in the sand
    if (RegionID >= 30) then
        switch (RegionID): caseof
        {
            [30] = function (x)
                player:setPos(496,-6,-816);
            end,
            [31] = function (x)
                player:setPos(816,-6,-743);
            end,
            [32] = function (x)
                player:setPos(216,9,-16);
            end,
            [33] = function (x)
                player:setPos(-296,9,416);
            end,
            [34] = function (x)
                player:setPos(-136,9,-176);
            end,
        }
        
    -- ornate door pressure plates
    else
        local door = GetNPCByID(QC_ORNATE_DOOR_OFFSET + RegionID - 1);
        local plate = GetNPCByID(QC_ORNATE_DOOR_OFFSET + RegionID);

        local totalWeight = plate:getLocalVar("weight");
        totalWeight = totalWeight + getWeight(player);
        plate:setLocalVar("weight", totalWeight);

        if (player:hasKeyItem(LOADSTONE) or totalWeight >= 3) then
            door:openDoor(15); -- open door with a 15 second time delay.
            plate:setAnimation(ANIMATION_OPEN_DOOR); -- this is supposed to light up the platform but it's not working. Tried other values too.
        end
    end
end;

function onRegionLeave(player,region)
    local RegionID = region:GetRegionID();

    if (RegionID < 30) then
        local door = GetNPCByID(QC_ORNATE_DOOR_OFFSET + RegionID - 1);
        local plate = GetNPCByID(QC_ORNATE_DOOR_OFFSET + RegionID);

        local totalWeight = plate:getLocalVar("weight");
        totalWeight = totalWeight - getWeight(player);
        plate:setLocalVar("weight", totalWeight);

        if (plate:getAnimation() == ANIMATION_OPEN_DOOR and totalWeight < 3) then
            plate:setAnimation(ANIMATION_CLOSE_DOOR);
        end
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

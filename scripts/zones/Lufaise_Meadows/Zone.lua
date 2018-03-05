-----------------------------------
--
-- Zone: Lufaise_Meadows (24)
--
-----------------------------------
package.loaded["scripts/zones/Lufaise_Meadows/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Lufaise_Meadows/TextIDs");
require("scripts/zones/Lufaise_Meadows/MobIDs");
require("scripts/globals/conquest");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/titles");
require("scripts/globals/zone");
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1,179,-26,327,219,-18,347);

    GetMobByID(COLORFUL_LESHY):setLocalVar("1",os.time() + math.random((43200), (86400)));

    UpdateNMSpawnPoint(PADFOOT);
    GetMobByID(PADFOOT):setRespawnTime(math.random(900, 10800));

    SetRegionalConquestOverseers(zone:getRegionID())
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
        player:setPos(-475.825,-20.461,281.149,11);
    end

    if (player:getCurrentMission(COP) == AN_INVITATION_WEST) then
        if (player:getVar("PromathiaStatus") == 0) then
            cs = 110;
        end
    elseif (player:getCurrentMission(COP) == CHAINS_AND_BONDS and player:getVar("PromathiaStatus") == 0) then
        cs = 111;
    end

    return cs;
end;

function onRegionEnter(player,region)
    local regionID =region:GetRegionID();
        if (regionID==1 and player:getCurrentMission(COP) == DAWN     and player:getVar("PromathiaStatus") == 6) then
        player:startEvent(116);
    end
end;

function onRegionLeave(player,region)
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 110) then
        player:messageSpecial(KI_STOLEN,0,MYSTERIOUS_AMULET);
        player:delKeyItem(MYSTERIOUS_AMULET);
        player:setVar("PromathiaStatus",1);
    elseif (csid == 111) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,14657);
        else
            player:addItem(14657);
            player:messageSpecial(ITEM_OBTAINED,14657);
            player:setVar("PromathiaStatus",1);
        end
    elseif (csid == 116) then
        player:setVar("PromathiaStatus",7);
        player:addTitle(BANISHER_OF_EMPTINESS);
    end
end;

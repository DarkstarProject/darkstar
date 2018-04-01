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
require("scripts/globals/npc_util");
require("scripts/globals/titles");
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1,179,-26,327,219,-18,347);

    SetServerVariable("realPadfoot",math.random(1,5));
    for _, v in pairs(PADFOOT) do
        SpawnMob(v);
    end

    SetRegionalConquestOverseers(zone:getRegionID());
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

    if (player:getCurrentMission(COP) == AN_INVITATION_WEST and player:getVar("PromathiaStatus") == 0) then
        cs = 110;
    elseif (player:getCurrentMission(COP) == CHAINS_AND_BONDS and player:getVar("PromathiaStatus") == 0) then
        cs = 111;
    end

    return cs;
end;

function onRegionEnter(player,region)
    local regionID = region:GetRegionID();
    if (regionID == 1 and player:getCurrentMission(COP) == DAWN and player:getVar("PromathiaStatus") == 6) then
        player:startEvent(116);
    end
end;

function onRegionLeave(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 110) then
        player:messageSpecial(KI_STOLEN,0,MYSTERIOUS_AMULET);
        player:delKeyItem(MYSTERIOUS_AMULET);
        player:setVar("PromathiaStatus",1);
    elseif (csid == 111 and npcUtil.giveItem(player, 14657)) then
        player:setVar("PromathiaStatus",1);
    elseif (csid == 116) then
        player:setVar("PromathiaStatus",7);
        player:addTitle(BANISHER_OF_EMPTINESS);
    end
end;

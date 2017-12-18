-----------------------------------
--
-- Zone: Caedarva_Mire (79)
--
-----------------------------------
package.loaded["scripts/zones/Caedarva_Mire/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Caedarva_Mire/TextIDs");
require("scripts/zones/Caedarva_Mire/MobIDs");
require("scripts/globals/missions");
require("scripts/globals/titles");
require("scripts/globals/zone");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    UpdateNMSpawnPoint(AYNU_KAYSEY);
    GetMobByID(AYNU_KAYSEY):setRespawnTime(math.random(900, 10800));
    GetMobByID(KHIMAIRA):setRespawnTime(math.random(12,36)*3600); -- 12 to 36 hours after maintenance, in 1-hour increments
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        player:setPos(339.996,2.5,-721.286,200);
    end
    if (prevZone == 69) then
        player:setPos(495.450,-28.25,-478.43,32);
    end
    if (prevZone == 56) then
        player:setPos(-252.715,-7.666,-30.64,128);
    end

    if (player:getCurrentMission(TOAU) == SHADES_OF_VENGEANCE and player:getVar("AhtUrganStatus") == 1) then
        cs = 21;
    end
 
    return cs;
end;

-----------------------------------
-- afterZoneIn
-----------------------------------

function afterZoneIn(player)
    player:entityVisualPacket("1pb1");
    player:entityVisualPacket("2pb1");
    player:entityVisualPacket("1pd1");
    player:entityVisualPacket("2pc1");
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
    --printf("CSID: %u",csid);
    --printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    --printf("CSID: %u",csid);
    --printf("RESULT: %u",option);

    if (csid == 21) then
        player:completeMission(TOAU,SHADES_OF_VENGEANCE);
        player:setVar("AhtUrganStatus", 0);
        player:setVar("TOAUM31_PERMITDAY", 0);
        player:setTitle(NASHMEIRAS_MERCENARY);
        player:addMission(TOAU,IN_THE_BLOOD);
    elseif (csid == 133) then -- enter instance, warp to periqia
        player:setPos(0,0,0,0,56);
    end
end;

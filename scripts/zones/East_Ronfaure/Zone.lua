-----------------------------------
--
-- Zone: East_Ronfaure (101)
--
-----------------------------------
package.loaded["scripts/zones/East_Ronfaure/TextIDs"] = nil;
package.loaded["scripts/globals/chocobo_digging"] = nil;
-----------------------------------

require("scripts/globals/zone");
require("scripts/globals/quests");
require("scripts/globals/settings");
require( "scripts/globals/icanheararainbow");
require("scripts/zones/East_Ronfaure/TextIDs");
require("scripts/globals/chocobo_digging");

-----------------------------------
-- Chocobo Digging vars
-----------------------------------
local itemMap = {
                    -- itemid, abundance, requirement
                    { 4504, 224, DIGREQ_NONE },
                    { 688, 184, DIGREQ_NONE },
                    { 17396, 276, DIGREQ_NONE },
                    { 698, 69, DIGREQ_NONE },
                    { 840, 63, DIGREQ_NONE },
                    { 691, 144, DIGREQ_NONE },
                    { 639, 29, DIGREQ_NONE },
                    { 694, 10, DIGREQ_NONE },
                    { 4386, 11, DIGREQ_NONE },
                    { 918, 10, DIGREQ_NONE },
                    { 4096, 100, DIGREQ_NONE },  -- all crystals
                    { 4545, 12, DIGREQ_BURROW },
                    { 636, 29, DIGREQ_BURROW },
                    { 617, 12, DIGREQ_BORE },
                    { 4570, 11, DIGREQ_MODIFIER },
                    { 4487, 12, DIGREQ_MODIFIER },
                    { 4409, 10, DIGREQ_MODIFIER },
                    { 1188, 12, DIGREQ_MODIFIER },
                    { 4532, 11, DIGREQ_MODIFIER },
                    { 574, 37, DIGREQ_NIGHT },
                };

local messageArray = { DIG_THROW_AWAY, FIND_NOTHING, ITEM_OBTAINED };

-----------------------------------
-- onChocoboDig
-----------------------------------
function onChocoboDig(player, precheck)
    return chocoboDig(player, itemMap, precheck, messageArray);
end;

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
        player:setPos(200.015,-3.187,-536.074,187);
    end

    if (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 0x0015;
    elseif (player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") ==1) then
        cs = 0x0017;
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
    if (csid == 0x0015) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    elseif (csid == 0x0017) then
        if (player:getYPos() >= -22) then
            player:updateEvent(0,0,0,0,0,7);
        else
            player:updateEvent(0,0,0,0,0,6);
        end
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0015) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    end
end;
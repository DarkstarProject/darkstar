-----------------------------------
--
-- Zone: West_Ronfaure (100)
--
-----------------------------------
package.loaded["scripts/zones/West_Ronfaure/TextIDs"] = nil;
package.loaded["scripts/globals/chocobo_digging"] = nil;
-----------------------------------

require("scripts/globals/zone");
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/conquest");
require("scripts/globals/icanheararainbow");
require("scripts/zones/West_Ronfaure/TextIDs");
require("scripts/globals/chocobo_digging");

-----------------------------------
-- Chocobo Digging vars
-----------------------------------
local itemMap = {
                    -- itemid, abundance, requirement
                    { 4504, 167, DIGREQ_NONE },
                    { 688, 15, DIGREQ_NONE },
                    { 17396, 20, DIGREQ_NONE },
                    { 698, 5, DIGREQ_NONE },
                    { 840, 117, DIGREQ_NONE },
                    { 691, 83, DIGREQ_NONE },
                    { 833, 83, DIGREQ_NONE },
                    { 639, 10, DIGREQ_NONE },
                    { 694, 63, DIGREQ_NONE },
                    { 918, 12, DIGREQ_NONE },
                    { 4096, 100, DIGREQ_NONE },  -- all crystals
                    { 4545, 5, DIGREQ_BURROW },
                    { 636, 63, DIGREQ_BURROW },
                    { 617, 63, DIGREQ_BORE },
                    { 4570, 10, DIGREQ_MODIFIER },
                    { 4487, 11, DIGREQ_MODIFIER },
                    { 4409, 12, DIGREQ_MODIFIER },
                    { 1188, 10, DIGREQ_MODIFIER },
                    { 4532, 12, DIGREQ_MODIFIER },
                    { 573, 23, DIGREQ_NIGHT },
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
    local manuals = {17187570,17187571};

    SetFieldManual(manuals);

    SetRegionalConquestOverseers(zone:getRegionID())
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-24.427,-53.107,140,127);
    end

    if (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 0x0033;
    elseif (player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") ==1) then    
        cs = 0x0035; 
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
    if (csid == 0x0033) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    elseif (csid == 0x0035) then
        player:updateEvent(0,0,0,0,0,5);
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0033) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    end
end;
-----------------------------------
--
-- Zone: South_Gustaberg (107)
--
-----------------------------------
package.loaded["scripts/zones/South_Gustaberg/TextIDs"] = nil;
package.loaded["scripts/globals/chocobo_digging"] = nil;
-----------------------------------

require("scripts/globals/zone");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/icanheararainbow");
require("scripts/zones/South_Gustaberg/TextIDs");
require("scripts/globals/chocobo_digging");

-----------------------------------
-- Chocobo Digging vars
-----------------------------------
local itemMap = {
                    -- itemid, abundance, requirement
                    { 17296, 252, DIGREQ_NONE },
                    { 17396, 227, DIGREQ_NONE },
                    { 846, 156, DIGREQ_NONE },
                    { 880, 133, DIGREQ_NONE },
                    { 936, 83, DIGREQ_NONE },
                    { 869, 80, DIGREQ_NONE },
                    { 749, 32, DIGREQ_NONE },
                    { 847, 23, DIGREQ_NONE },
                    { 644, 5, DIGREQ_NONE },
                    { 4096, 100, DIGREQ_NONE },  -- all crystals
                    { 4545, 5, DIGREQ_BURROW },
                    { 636, 63, DIGREQ_BURROW },
                    { 617, 63, DIGREQ_BORE },
                    { 4570, 10, DIGREQ_MODIFIER },
                    { 4487, 11, DIGREQ_MODIFIER },
                    { 4409, 12, DIGREQ_MODIFIER },
                    { 1188, 10, DIGREQ_MODIFIER },
                    { 4532, 12, DIGREQ_MODIFIER },
                    { 575, 14, DIGREQ_NIGHT },
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
    local manuals = {17216207,17216208};

    SetFieldManual(manuals);
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-601.433,35.204,-520.031,1);
    end

    if (player:getCurrentMission(COP) == THE_CALL_OF_THE_WYRMKING and player:getVar("VowsDone") == 1) then
        cs= 0x038A;
    elseif (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 0x0385;
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
    if (csid == 0x0385) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x038A) then
        if (player:getCurrentMission(COP) == A_TRANSIENT_DREAM) then
            player:completeMission(COP,A_TRANSIENT_DREAM);
            player:addMission(COP,THE_CALL_OF_THE_WYRMKING);
        end
        player:setVar("VowsDone",0);
    elseif (csid == 0x0385) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    end
end;
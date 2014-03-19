-----------------------------------
-- 
-- Zone: Hall_of_Transference
-- 
-----------------------------------
package.loaded["scripts/zones/Hall_of_Transference/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("/scripts/globals/teleports");
require("scripts/zones/Hall_of_Transference/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1,-281,-5,277,-276,0,284); 		-- Holla
    zone:registerRegion(2,276,-84,-82,283,-80,-75); 	-- Mea
    zone:registerRegion(3,-283,-45,-283,-276,-40,-276); -- Dem
    zone:registerRegion(4,0,0,0,0,0,0);
    
    zone:registerRegion(5,288.847,-83.960,-40.693,291.209,-79.960,-37.510);     -- Mea Sky Teleporter
    zone:registerRegion(6,-240.181,-3.960,268.409,-237.671,1.960,271.291);      -- Holla Sky Teleporter
    zone:registerRegion(7,-240.797,-43.960,-291.552,-237.944,-39.960,-288.954); -- Dem Sky Teleporter
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    
    if((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
        player:setPos(274,-82,-62 ,180);
     end
     
    return cs;
end;

-----------------------------------
-- onRegionEnter          
-----------------------------------

function onRegionEnter(player,region)

    switch (region:GetRegionID()): caseof
    {
        [1] = function (x) -- Holla
            player:setVar("option",1);
            player:startEvent(103);
        end,
        [2] = function (x) -- Mea
            player:setVar("option",1);
            player:startEvent(104);
        end,
        [3] = function (x) -- Dem
            player:setVar("option",1);
            player:startEvent(105);
        end,
        [4] = function (x)
            player:setVar("option",2);
            player:startEvent(103);
        end,
        [5] = function (x)
            if (player:getVar("MeaChipRegistration") == 1) then
                local Rand = math.random(1,100);
                if (Rand <= 95) then -- 5% Chance chip breaks
                    player:startEvent(0x00A1); -- To Sky
                else
                    player:startEvent(0x00A9); -- Chip Breaks!
                end
            else
                player:startEvent(0x00A2); -- Please Register..
            end
        end,
        [6] = function (x)
            if (player:getVar("HollaChipRegistration") == 1) then
                local Rand = math.random(1,100);
                if (Rand <= 95) then -- 5% Chance chip breaks
                    player:startEvent(0x00A1); -- To Sky
                else
                    player:startEvent(0x00AA); -- Chip Breaks!
                end
            else
                player:startEvent(0x00A2); -- Please Register..
            end
        end,
        [7] = function (x)
            if (player:getVar("DemChipRegistration") == 1) then
                local Rand = math.random(1,100);
                if (Rand <= 95) then -- 5% Chance chip breaks
                    player:startEvent(0x00A1); -- To Sky
                else
                    player:startEvent(0x00AB); -- Chip Breaks!
                end
            else
                player:startEvent(0x00A2); -- Please Register..
            end
        end,
    }
    

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
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

    if(csid == 103 and option == 1)then
        player:setPos(340.082, 19.103, -59.979, 127, 102); 	-- To La Theine Plateau {R}
    elseif(csid == 104 and option == 1)then
        player:setPos(179.92, 35.15, 260.137, 64, 117);	    -- To Tahrongi Canyon {R}
    elseif(csid == 105 and option == 1)then
        player:setPos(139.974, 19.103, 219.989, 128, 108); 	-- To Konschtat Highlands {R}
    elseif (csid == 0x00A1 and option == 1) then 
        toSkyGreenPorterLeft(player);
    elseif (csid == 0x00A9 and option == 1) then
        player:setVar("MeaChipRegistration",0); 
        toSkyGreenPorterLeft(player);
    elseif (csid == 0x00AA and option == 1) then
        player:setVar("HollaChipRegistration",0); 
        toSkyGreenPorterLeft(player);
    elseif (csid == 0x00AB and option == 1) then
        player:setVar("DemChipRegistration",0); 
        toSkyGreenPorterLeft(player);
    end
end;
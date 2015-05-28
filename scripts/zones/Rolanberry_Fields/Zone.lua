-----------------------------------
--
-- Zone: Rolanberry_Fields (110)
--
-----------------------------------
package.loaded["scripts/zones/Rolanberry_Fields/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Rolanberry_Fields/TextIDs");
require("scripts/globals/icanheararainbow");
require("scripts/globals/zone");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    local manuals = {17228375,17228376};
    local book = GetNPCByID(17228375);
    local rift = GetNPCByID(17228385)

    book:setPos(-98,-9,-655,216)
    rift:setPos(-90.707,-7.899,-663.99,216)
    SetFieldManual(manuals);

    -- Simurgh
    SetRespawnTime(17228242, 900, 10800);

    -- Spawns Silk Caterpillar (temporary until someone implements a way to make it spawn properly)
    SpawnMob(17227782,300,660);

end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn( player, prevZone)
	local cs = -1;
    
	if( player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
		player:setPos( -381.747, -31.068, -788.092, 211);
	end

	if( triggerLightCutscene( player)) then -- Quest: I Can Hear A Rainbow
		cs = 0x0002;
    elseif(player:getCurrentMission(WINDURST) == VAIN and player:getVar("WINDURST81") ==1)then	
        cs = 0x0004; 
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

function onRegionEnter( player, region)
end;

-----------------------------------		
-- onGameHour		
-----------------------------------	

function onGameHour()

	local VanadielHour = VanadielHour();
	local SilkCaterpillar = 17227782;
		
	if(VanadielHour % 1 == 0 and GetMobAction( SilkCaterpillar ) == 16) then 
		DespawnMob( SilkCaterpillar );
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate( player, csid, option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
	if ( csid == 0x0002) then
		lightCutsceneUpdate( player);  -- Quest: I Can Hear A Rainbow
    elseif (csid == 0x0004) then
        if(player:getZPos() <  75) then
            player:updateEvent(0,0,0,0,0,1);
        else
            player:updateEvent(0,0,0,0,0,2);
        end
	end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish( player, csid, option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
	if( csid == 0x0002) then
		lightCutsceneFinish( player);  -- Quest: I Can Hear A Rainbow
	end
end;

-- Functions below used in quest: I Can Hear a Rainbow

require( "scripts/globals/status");
require( "scripts/globals/quests");
require( "scripts/globals/weather");

colorsAvailable = { 102, 103, 104, 105, 106, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 123, 124, 125}; -- Zone IDs 

-- Data below from http://wiki.ffxiclopedia.org/wiki/I_Can_Hear_a_Rainbow - Feb. 02, 2013

colorsAvailable[102] = { false, false, false, true,  true,  false, false}; -- La Theine Plateau
colorsAvailable[103] = { true,  false, true,  false, false, false, false}; -- Valkurm Dunes
colorsAvailable[104] = { false, false, false, false, true,  false, true }; -- Jugner Forest
colorsAvailable[105] = { false, false, true,  false, false, true,  false}; -- Batallia Downs
colorsAvailable[106] = { false, true,  false, false, false, false, false}; -- North Gustaberg
colorsAvailable[108] = { false, false, true,  false, false, false, true }; -- Konschtat Highlands
colorsAvailable[109] = { false, false, false, false, true,  false, true }; -- Pashhow Marshlands
colorsAvailable[110] = { true,  false, false, false, true,  false, false}; -- Rolanberry Fields
colorsAvailable[111] = { false, false, false, false, false, true,  false}; -- Beaucedine Glacier
colorsAvailable[112] = { false, false, false, false, false, true,  false}; -- Xarcabard
colorsAvailable[113] = { true,  false, false, true,  false, false, false}; -- Cape Teriggan
colorsAvailable[114] = { true,  true,  true,  false, false, false, false}; -- Eastern Altepa Desert
colorsAvailable[115] = { false, true,  false, false, false, false, false}; -- West Sarutabaruta
colorsAvailable[116] = { false, true,  false, false, false, false, false}; -- East Sarutabaruta
colorsAvailable[117] = { false, false, true,  true,  false, false, false}; -- Tahrongi Canyon
colorsAvailable[118] = { false, true,  false, true,  true,  false, false}; -- Buburimu Peninsula
colorsAvailable[119] = { true,  false, true,  false, false, false, false}; -- Meriphataud Mountains
colorsAvailable[120] = { false, false, true,  false, false, false, true }; -- Sauromugue Champaign
colorsAvailable[121] = { false, false, false, false, true,  false, true }; -- The Sanctuary of Zi'Tah
colorsAvailable[123] = { true,  false, false, false, true,  false, false}; -- Yuhtunga Jungle
colorsAvailable[124] = { true,  true,  false, false, true,  false, false}; -- Yhoator Jungle
colorsAvailable[125] = { true,  false, true,  false, false, false, false}; -- Western Altepa Desert

-- The Event IDs to trigger the light cutscene for the following 3 zones is currently unknown.
-- They are included only because they are listed at http://wiki.ffxiclopedia.org/wiki/I_Can_Hear_a_Rainbow

-- colorsAvailable[128] = { false, false, false, true,  false, false, false}; -- Valley of Sorrows
-- colorsAvailable[136] = { false, false, false, false, false, true,  false}; -- Beaucedine Glacier (S)
-- colorsAvailable[205] = { true,  false, false, false, false, false, false}; -- Ifrit's Cauldron

-----------------------------------
-- triggerLightCutscene
-----------------------------------

function triggerLightCutscene( player)

	cutsceneTriggered = false;

	RED    = 1;
	ORANGE = 2;
	YELLOW = 3;
	GREEN  = 4;
	BLUE   = 5;
	INDIGO = 6;
	VIOLET = 7;
	
	if( player:hasItem( 1125, 0)) then   -- Player has Carbuncle's Ruby?

		if( player:getQuestStatus( WINDURST, I_CAN_HEAR_A_RAINBOW) == QUEST_ACCEPTED) then

			local colors = player:getVar( "I_CAN_HEAR_A_RAINBOW");

			if( colors == nil) then -- Variable 'I_CAN_HEAR_A_RAINBOW' not set
				colors = 0;
			end

			hasRed    = ( tonumber( colors) %   2 >=  1);
			hasOrange = ( tonumber( colors) %   4 >=  2);
			hasYellow = ( tonumber( colors) %   8 >=  4);
			hasGreen  = ( tonumber( colors) %  16 >=  8);
			hasBlue   = ( tonumber( colors) %  32 >= 16);
			hasIndigo = ( tonumber( colors) %  64 >= 32);
			hasViolet = ( tonumber( colors) % 128 >= 64);

			local zone    = player:getZone():getID();
			local weather = player:getWeather();

			if(     hasRed    == false and ( weather == WEATHER_HOT_SPELL  or weather == WEATHER_HEAT_WAVE    )) then
				if( colorsAvailable[zone][RED]) then
					cutsceneTriggered = true;
					player:setVar( "I_CAN_HEAR_A_RAINBOW", colors +  1);
					player:setVar( "I_CAN_HEAR_A_RAINBOW_Weather", weather);
				end
			elseif( hasOrange == false and ( weather == WEATHER_NONE       or weather == WEATHER_SUNSHINE     )) then
				if( colorsAvailable[zone][ORANGE]) then
					cutsceneTriggered = true;
					player:setVar( "I_CAN_HEAR_A_RAINBOW", colors +  2);
					player:setVar( "I_CAN_HEAR_A_RAINBOW_Weather", weather);
				end
			elseif( hasYellow == false and ( weather == WEATHER_DUST_STORM or weather == WEATHER_SAND_STORM   )) then
				if( colorsAvailable[zone][YELLOW]) then
					cutsceneTriggered = true;
					player:setVar( "I_CAN_HEAR_A_RAINBOW", colors +  4);
					player:setVar( "I_CAN_HEAR_A_RAINBOW_Weather", weather);
				end
			elseif( hasGreen  == false and ( weather == WEATHER_WIND       or weather == WEATHER_GALES        )) then
				if( colorsAvailable[zone][GREEN]) then
					cutsceneTriggered = true;
					player:setVar( "I_CAN_HEAR_A_RAINBOW", colors +  8);
					player:setVar( "I_CAN_HEAR_A_RAINBOW_Weather", weather);
				end
			elseif( hasBlue   == false and ( weather == WEATHER_RAIN       or weather == WEATHER_SQUALL       )) then
				if( colorsAvailable[zone][BLUE]) then
					cutsceneTriggered = true;
					player:setVar( "I_CAN_HEAR_A_RAINBOW", colors + 16);
					player:setVar( "I_CAN_HEAR_A_RAINBOW_Weather", weather);
				end
			elseif( hasIndigo == false and ( weather == WEATHER_SNOW       or weather == WEATHER_BLIZZARDS    )) then
				if( colorsAvailable[zone][INDIGO]) then
					cutsceneTriggered = true;
					player:setVar( "I_CAN_HEAR_A_RAINBOW", colors + 32);
					player:setVar( "I_CAN_HEAR_A_RAINBOW_Weather", weather);
				end
			elseif( hasViolet == false and ( weather == WEATHER_THUNDER    or weather == WEATHER_THUNDERSTORMS)) then
				if( colorsAvailable[zone][VIOLET]) then
					cutsceneTriggered = true;
					player:setVar( "I_CAN_HEAR_A_RAINBOW", colors + 64);
					player:setVar( "I_CAN_HEAR_A_RAINBOW_Weather", weather);
				end
			end

			if( cutsceneTriggered) then
				fixChocoboBug( player);
			end
		end
	end

	return cutsceneTriggered;
end;

-----------------------------------
-- lightCutsceneUpdate
-----------------------------------

function lightCutsceneUpdate( player)

	local weather = player:getVar( "I_CAN_HEAR_A_RAINBOW_Weather");

	if( weather == WEATHER_SUNSHINE) then -- In some zones the light cutscene does not handle WEATHER_SUNSHINE properly
		weather = WEATHER_NONE;
	end

	if( player:getVar( "I_CAN_HEAR_A_RAINBOW") < 127) then
		player:updateEvent( 0, 0, weather);
	else
		player:updateEvent( 0, 0, weather, 6);
	end
end;

-----------------------------------
-- lightCutsceneFinish
-----------------------------------

function lightCutsceneFinish( player)
	
	fixChocoboBug( player);
	player:setVar( "I_CAN_HEAR_A_RAINBOW_Weather", 0);
end;

-----------------------------------
-- fixChocoboBug
-----------------------------------

function fixChocoboBug( player)
	if( player:hasStatusEffect( EFFECT_CHOCOBO)) then
		if(     player:getAnimation() == 5) then
			player:setAnimation( 0);
		elseif( player:getAnimation() == 0) then
			player:setAnimation( 5);
		end
	end
end;

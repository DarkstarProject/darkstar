---------------------------------------------------------------------------------------------------
-- func: @setpoint
-- auth: Joe
-- desc: @setpoint allows players to save up to 9 positions with a 44 char description and then return to them as needed.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "ssssssssssssssss"
};

local function delPointNum(player,pointNumber)

	player:setVar("@setpoint" .. pointNumber .. "_XPos", 0);
	player:setVar("@setpoint" .. pointNumber .. "_YPos", 0);
	player:setVar("@setpoint" .. pointNumber .. "_ZPos", 0);
	player:setVar("@setpoint" .. pointNumber .. "_Zone", 0);
	player:setVar("@setpoint" .. pointNumber .. "_DescA", 0);
	player:setVar("@setpoint" .. pointNumber .. "_DescB", 0);
	player:setVar("@setpoint" .. pointNumber .. "_DescC", 0);
	player:setVar("@setpoint" .. pointNumber .. "_DescD", 0);
	player:setVar("@setpoint" .. pointNumber .. "_DescE", 0);
	player:setVar("@setpoint" .. pointNumber .. "_DescF", 0);
	player:setVar("@setpoint" .. pointNumber .. "_DescG", 0);
	player:setVar("@setpoint" .. pointNumber .. "_DescH", 0);
	player:setVar("@setpoint" .. pointNumber .. "_DescI", 0);
	player:setVar("@setpoint" .. pointNumber .. "_DescJ", 0);
	player:setVar("@setpoint" .. pointNumber .. "_DescK", 0);
end;

local function checkPointNumber(pointNumber)

	if (pointNumber == nil or tonumber(pointNumber) == nil) then
		return false;
	end

	if (tonumber(pointNumber) >= 1 and tonumber(pointNumber) <= 9) then

		return true;
	end

	return false;
end;

local function pointHelp(player)


	player:TellToPlayer("@setpoint usage:");
	player:TellToPlayer("     Create a set point:    @setpoint <number>");
	player:TellToPlayer("     Goto a set point:    @setpoint goto <number>");
	player:TellToPlayer("     Delete a set point:    @setpoint del <number>");
	player:TellToPlayer("     Delete all set points:    @setpoint del all");
	player:TellToPlayer("     View set point descriptions:    @setpoint list");
end;

local function createPoint(player,pointNumber,description)

	if (player:isInMogHouse()) then
		player:TellToPlayer("Cannot create a point inside a mog house.");
		return;
	end

	if (checkPointNumber(pointNumber) == false) then
		player:TellToPlayer("Point '" .. pointNumber .. "' is not a valid set point.");
		player:TellToPlayer(" ");
		pointHelp(player);
		return;
	end

	delPointNum(player,pointNumber); -- Need to erase the description variables in case player sets a new point over this one with a shorter description.

	player:setVar("@setpoint" .. pointNumber .. "_XPos", player:getXPos());
	player:setVar("@setpoint" .. pointNumber .. "_YPos", player:getYPos());
	player:setVar("@setpoint" .. pointNumber .. "_ZPos", player:getZPos());
	player:setVar("@setpoint" .. pointNumber .. "_Zone", player:getZoneID());

	if (description ~= nil) then

		local desc = 0;
		local part = "A";
		for x = 1, 44 do
			if (string.byte(description,x) ~= nil) then
				desc = bit.lshift( desc, 8) + string.byte(description,x);
			else
				player:setVar("@setpoint" .. pointNumber .. "_Desc" .. part, desc);
				break;
			end

			if (x == 4) then
				part = "B";
				player:setVar("@setpoint" .. pointNumber .. "_DescA", desc);
				desc = 0;
			elseif (x == 8) then
				part = "C";
				player:setVar("@setpoint" .. pointNumber .. "_DescB", desc);
				desc = 0;
			elseif (x == 12) then
				part = "D";
				player:setVar("@setpoint" .. pointNumber .. "_DescC", desc);
				desc = 0;
			elseif (x == 16) then
				part = "E";
				player:setVar("@setpoint" .. pointNumber .. "_DescD", desc);
				desc = 0;
			elseif (x == 20) then
				part = "F";
				player:setVar("@setpoint" .. pointNumber .. "_DescE", desc);
				desc = 0;
			elseif (x == 24) then
				part = "G";
				player:setVar("@setpoint" .. pointNumber .. "_DescF", desc);
				desc = 0;
			elseif (x == 28) then
				part = "H";
				player:setVar("@setpoint" .. pointNumber .. "_DescG", desc);
				desc = 0;
			elseif (x == 32) then
				part = "I";
				player:setVar("@setpoint" .. pointNumber .. "_DescH", desc);
				desc = 0;
			elseif (x == 36) then
				part = "J";
				player:setVar("@setpoint" .. pointNumber .. "_DescI", desc);
				desc = 0;
			elseif (x == 40) then
				part = "K";
				player:setVar("@setpoint" .. pointNumber .. "_DescJ", desc);
				desc = 0;
			elseif (x == 44) then
				player:setVar("@setpoint" .. pointNumber .. "_DescK", desc);
			end
		end
	end
end;

local function delPoint(player,pointNumber)

	if (pointNumber == "all") then
		for x = 1, 9 do
			delPointNum(player,x);
		end

		player:TellToPlayer("All points deleted.");
	else
		if (checkPointNumber(pointNumber) == false) then
			player:TellToPlayer("Point '" .. pointNumber .. "' is not a valid set point.");
			player:TellToPlayer(" ");
			pointHelp(player);
			return;
		end

		delPointNum(player,pointNumber);
		player:TellToPlayer("Point " .. pointNumber .. " has been deleted.");
	end
end;

local function gotoPoint(player,pointNumber)

	if (player:isInMogHouse()) then
		player:TellToPlayer("The command '@setpoint goto' will not work while in mog house.");
		return;
	end

	if (checkPointNumber(pointNumber) == false) then
		player:TellToPlayer("Point '" .. pointNumber .. "' is not a valid set point.");
		player:TellToPlayer(" ");
		pointHelp(player);
		return;
	end

	local xPos  = player:getVar("@setpoint" .. pointNumber .. "_XPos");
	local yPos  = player:getVar("@setpoint" .. pointNumber .. "_YPos");
	local zPos  = player:getVar("@setpoint" .. pointNumber .. "_ZPos");
	local zone  = player:getVar("@setpoint" .. pointNumber .. "_Zone");

	if (zone ~= 0) then

		if( zone ~= player:getZoneID()) then
			player:setPos(xPos,yPos,zPos,0,zone);
		else
			player:setPos(xPos,yPos,zPos,0);
		end
	else
		player:TellToPlayer("Point " .. pointNumber .. " has been corrupted.");
		delPointNum(player,pointNumber);
		player:TellToPlayer("Point " .. pointNumber .. " has been removed from the list.");
	end
end;

function decimalToHex(number)

	local hexstr = '0123456789abcdef'
	local hex = ''

	while number > 0 do
		local mod = math.fmod(number, 16);
		hex = string.sub(hexstr, mod+1, mod+1) .. hex;
		number = math.floor(number / 16);
	end

	if hex == '' then
		hex = '0';
	end
	
	return hex;
end

local function getZoneName(zoneID)

	local zone = {};

	zone[0] = "Residential Area (Dummy)";
	zone[1] = "Phanauet Channel";
	zone[2] = "Carpenters' Landing";
	zone[3] = "Manaclipper";
	zone[4] = "Bibiki Bay";
	zone[5] = "Uleguerand Range";
	zone[6] = "Bearclaw Pinnacle";
	zone[7] = "Attohwa Chasm";
	zone[8] = "Boneyard Gully";
	zone[9] = "Pso'Xja";
	zone[10] = "The Shrouded Maw";
	zone[11] = "Oldton Movalpolos";
	zone[12] = "Newton Movalpolos";
	zone[13] = "Mine Shaft #2716";
	zone[14] = "Hall of Transference";
	zone[15] = "Abyssea - Konschtat";
	zone[16] = "Promyvion - Holla";
	zone[17] = "Spire of Holla";
	zone[18] = "Promyvion -  Dem";
	zone[19] = "Spire of Dem";
	zone[20] = "Promyvion - Mea";
	zone[21] = "Spire of Mea";
	zone[22] = "Promyvion - Vahzl";
	zone[23] = "Spire of Vahzl";
	zone[24] = "Lufaise Meadows";
	zone[25] = "Misareaux Coast";
	zone[26] = "Tavnazian Safehold";
	zone[27] = "Phomiuna Aqueducts";
	zone[28] = "Sacrarium";
	zone[29] = "Riverne - Site #B01";
	zone[30] = "Riverne - Site #A01";
	zone[31] = "Monarch Linn";
	zone[32] = "Sealion's Den";
	zone[33] = "Al'Taieu";
	zone[34] = "Grand Palace of Hu'Xzoi";
	zone[35] = "The Garden of Ru'Hmet";
	zone[36] = "Empyreal Paradox";
	zone[37] = "Temenos";
	zone[38] = "Apollyon";
	zone[39] = "Dynamis - Valkurm";
	zone[40] = "Dynamis - Buburimu";
	zone[41] = "Dynamis - Qufim";
	zone[42] = "Dynamis - Tavnazia";
	zone[43] = "Diorama Abdhaljs-Ghelsba";
	zone[44] = "Abdhaljs Isle-Purgonorgo";
	zone[45] = "Abyssea - Tahrongi";
	zone[46] = "Open sea route to Al Zahbi";
	zone[47] = "Open sea route to Mhaura";
	zone[48] = "Al Zahbi";
	zone[49] = "Test Area (Checkerboard Zone)";
	zone[50] = "Aht Urhgan Whitegate";
	zone[51] = "Wajaom Woodlands";
	zone[52] = "Bhaflau Thickets";
	zone[53] = "Nashmau";
	zone[54] = "Arrapago Reef";
	zone[55] = "Ilrusi Atoll";
	zone[56] = "Periqia";
	zone[57] = "Talacca Cove";
	zone[58] = "Silver Sea route to Nashmau";
	zone[59] = "Silver Sea route to Al Zahbi";
	zone[60] = "The Ashu Talif";
	zone[61] = "Mount Zhayolm";
	zone[62] = "Halvung";
	zone[63] = "Lebros Cavern";
	zone[64] = "Navukgo Execution Chamber";
	zone[65] = "Mamook";
	zone[66] = "Mamool Ja Training Grounds";
	zone[67] = "Jade Sepulcher";
	zone[68] = "Aydeewa Subterrane";
	zone[69] = "Leujaoam Sanctum";
	zone[70] = "Chocobo Circuit";
	zone[71] = "The Colosseum";
	zone[72] = "Alzadaal Undersea Ruins";
	zone[73] = "Zhayolm Remnants";
	zone[74] = "Arrapago Remnants";
	zone[75] = "Bhaflau Remnants";
	zone[76] = "Silver Sea Remnants";
	zone[77] = "Nyzul Isle";
	zone[78] = "Hazhalm Testing Grounds";
	zone[79] = "Caedarva Mire";
	zone[80] = "Southern San d'Oria [S]";
	zone[81] = "East Ronfaure [S]";
	zone[82] = "Jugner Forest [S]";
	zone[83] = "Vunkerl Inlet [S]";
	zone[84] = "Batallia Downs [S]";
	zone[85] = "La Vaule [S]";
	zone[86] = "Everbloom Hollow";
	zone[87] = "Bastok Markets [S]";
	zone[88] = "North Gustaberg [S]";
	zone[89] = "Grauberg [S]";
	zone[90] = "Pashhow Marshlands [S]";
	zone[91] = "Rolanberry Fields [S]";
	zone[92] = "Beadeaux [S]";
	zone[93] = "Ruhotz Silvermines";
	zone[94] = "Windurst Waters [S]";
	zone[95] = "West Sarutabaruta [S]";
	zone[96] = "Fort Karugo - Narugo [S]";
	zone[97] = "Meriphataud Mountains [S]";
	zone[98] = "Sauromugue Champaign [S]";
	zone[99] = "Castle Oztroja [S]";
	zone[100] = "West Ronfaure";
	zone[101] = "East Ronfaure";
	zone[102] = "La Theine Plateau";
	zone[103] = "Valkurm Dunes";
	zone[104] = "Jugner Forest";
	zone[105] = "Batallia Downs";
	zone[106] = "North Gustaberg";
	zone[107] = "South Gustaberg";
	zone[108] = "Konschtat Highlands";
	zone[109] = "Pashhow Marshlands";
	zone[110] = "Rolanberry Fields";
	zone[111] = "Beaucedine Glacier";
	zone[112] = "Xarcabard";
	zone[113] = "Cape Teriggan";
	zone[114] = "Eastern Altepa Desert";
	zone[115] = "West Sarutabaruta";
	zone[116] = "East Sarutabaruta";
	zone[117] = "Tahrongi Canyon";
	zone[118] = "Buburimu Peninsula";
	zone[119] = "Meriphataud Mountains";
	zone[120] = "Sauromugue Champaign";
	zone[121] = "The Sanctuary of Zi'Tah";
	zone[122] = "Ro'Maeve";
	zone[123] = "Yuhtunga Jungle";
	zone[124] = "Yhoator Jungle";
	zone[125] = "Western Altepa Desert";
	zone[126] = "Qufim Island";
	zone[127] = "Behemoth's Dominion";
	zone[128] = "Valley of Sorrows";
	zone[129] = "Ghoyu's Reverie";
	zone[130] = "Ru'Aun Gardens";
	zone[131] = "Mordion Gaol";
	zone[132] = "Abyssea - La Theine";
	zone[133] = "Character Selection Screen Background";
	zone[134] = "Dynamis - Beaucedine";
	zone[135] = "Dynamis - Xarcabard";
	zone[136] = "Beaucedine Glacier [S]";
	zone[137] = "Xarcabard [S]";
	zone[138] = "Castle Zvahl Baileys [S]";
	zone[139] = "Horlais Peak";
	zone[140] = "Ghelsba Outpost";
	zone[141] = "Fort Ghelsba";
	zone[142] = "Yughott Grotto";
	zone[143] = "Palborough Mines";
	zone[144] = "Waughroon Shrine";
	zone[145] = "Giddeus";
	zone[146] = "Balga's Dais";
	zone[147] = "Beadeaux";
	zone[148] = "Qulun Dome";
	zone[149] = "Davoi";
	zone[150] = "Monastic Cavern";
	zone[151] = "Castle Oztroja";
	zone[152] = "Altar Room";
	zone[153] = "The Boyahda Tree";
	zone[154] = "Dragon's Aery";
	zone[155] = "Castle Zvahl Keep [S]";
	zone[156] = "Throne Room [S]";
	zone[157] = "Middle Delkfutt's Tower";
	zone[158] = "Upper Delkfutt's Tower";
	zone[159] = "Temple of Uggalepih";
	zone[160] = "Den of Rancor";
	zone[161] = "Castle Zvahl Baileys";
	zone[162] = "Castle Zvahl Keep";
	zone[163] = "Sacrificial Chamber";
	zone[164] = "Garlaige Citadel [S]";
	zone[165] = "Throne Room";
	zone[166] = "Ranguemont Pass";
	zone[167] = "Bostaunieux Oubliette";
	zone[168] = "Chamber of Oracles";
	zone[169] = "Toraimarai Canal";
	zone[170] = "Full Moon Fountain";
	zone[171] = "Crawlers' Nest [S]";
	zone[172] = "Zeruhn Mines";
	zone[173] = "Korroloka Tunnel";
	zone[174] = "Kuftal Tunnel";
	zone[175] = "The Eldieme Necropolis [S]";
	zone[176] = "Sea Serpent Grotto";
	zone[177] = "Ve'Lugannon Palace";
	zone[178] = "The Shrine of Ru'Avitau";
	zone[179] = "Stellar Fulcrum";
	zone[180] = "La'Loff Amphitheater";
	zone[181] = "The Celestial Nexus";
	zone[182] = "Walk of Echoes";
	zone[183] = "Maquette Abdhaljs-Legion";
	zone[184] = "Lower Delkfutt's Tower";
	zone[185] = "Dynamis - San d'Oria";
	zone[186] = "Dynamis - Bastok";
	zone[187] = "Dynamis - Windurst";
	zone[188] = "Dynamis - Jeuno";
	zone[189] = "Unnamed";
	zone[190] = "King Ranperre's Tomb";
	zone[191] = "Dangruf Wadi";
	zone[192] = "Inner Horutoto Ruins";
	zone[193] = "Ordelle's Caves";
	zone[194] = "Outer Horutoto Ruins";
	zone[195] = "The Eldieme Necropolis";
	zone[196] = "Gusgen Mines";
	zone[197] = "Crawlers' Nest";
	zone[198] = "Maze of Shakhrami";
	zone[199] = "Unnamed";
	zone[200] = "Garlaige Citadel";
	zone[201] = "Cloister of Gales";
	zone[202] = "Cloister of Storms";
	zone[203] = "Cloister of Frost";
	zone[204] = "Fei'Yin";
	zone[205] = "Ifrit's Cauldron";
	zone[206] = "Qu'Bia Arena";
	zone[207] = "Cloister of Flames";
	zone[208] = "Quicksand Caves";
	zone[209] = "Cloister of Tremors";
	zone[210] = "Unnamed";
	zone[211] = "Cloister of Tides";
	zone[212] = "Gustav Tunnel";
	zone[213] = "Labyrinth of Onzozo";
	zone[214] = "Residential Area (Alt)";
	zone[215] = "Abyssea - Attohwa";
	zone[216] = "Abyssea - Misareaux";
	zone[217] = "Abyssea - Vunkerl";
	zone[218] = "Abyssea - Altepa";
	zone[219] = "Unnamed";
	zone[220] = "Ship bound for Selbina";
	zone[221] = "Ship bound for Mhaura";
	zone[222] = "Provenance";
	zone[223] = "San d'Oria-Jeuno Airship";
	zone[224] = "Bastok-Jeuno Airship";
	zone[225] = "Windurst-Jeuno Airship";
	zone[226] = "Kazham-Jeuno Airship";
	zone[227] = "Ship bound for Selbina (with Pirates)";
	zone[228] = "Ship bound for Mhaura (with Pirates)";
	zone[229] = "Unnamed";
	zone[230] = "Southern San d'Oria";
	zone[231] = "Northern San d'Oria";
	zone[232] = "Port San d'Oria";
	zone[233] = "Chateau d'Oraguille";
	zone[234] = "Bastok Mines";
	zone[235] = "Bastok Markets";
	zone[236] = "Port Bastok";
	zone[237] = "Metalworks";
	zone[238] = "Windurst Waters";
	zone[239] = "Windurst Walls";
	zone[240] = "Port Windurst";
	zone[241] = "Windurst Woods";
	zone[242] = "Heavens Tower";
	zone[243] = "Ru'Lude Gardens";
	zone[244] = "Upper Jeuno";
	zone[245] = "Lower Jeuno";
	zone[246] = "Port Jeuno";
	zone[247] = "Rabao";
	zone[248] = "Selbina";
	zone[249] = "Mhaura";
	zone[250] = "Kazham";
	zone[251] = "Hall of the Gods";
	zone[252] = "Dho Gates";
	zone[252] = "Norg";
	zone[253] = "Abyssea - Uleguerand";
	zone[254] = "Abyssea - Grauberg";
	zone[255] = "Abyssea - Empyreal Paradox";
	zone[256] = "Western Adoulin";
	zone[257] = "Eastern Adoulin";
	zone[258] = "Rala Waterways";
	zone[259] = "Moh Gates";
	zone[259] = "Rala Waterways [U]";
	zone[260] = "Yahse Hunting Grounds";
	zone[261] = "Ceizak Battlegrounds";
	zone[262] = "Foret de Hennetiel";
	zone[263] = "Yorcia Weald";
	zone[264] = "Yorcia Weald [U]";
	zone[265] = "Morimar Basalt Fields";
	zone[266] = "Marjami Ravine";
	zone[267] = "Kamihr Drifts";
	zone[268] = "Sih Gates";
	zone[270] = "Cirdas Caverns";
	zone[271] = "Cirdas Caverns [U]";
	zone[273] = "Woh Gates";
	zone[274] = "Outer Ra'Kaznar";
	zone[275] = "Outer Ra'Kaznar [U]";
	zone[276] = "Ra'kaznar Inner Court";
	zone[277] = "Ra'Kaznar Turris";
	zone[278] = "Unnamed";
	zone[279] = "Unnamed";
	zone[280] = "Mog Garden";
	zone[281] = "Leafallia";
	zone[282] = "Mount Kamihr";
	zone[283] = "Silver Knife";
	zone[284] = "Celennia Memorial Library";
	zone[285] = "Feretory";

	return zone[zoneID];
end;

local function listPoints(player)

	local description;

	local xPos;
	local yPos;
	local zPos;
	local zone;
	local descA;
	local descB;
	local descC;
	local descD;
	local descE;
	local descF;
	local descG;
	local descH;
	local descI;
	local descJ;
	local descK;

	player:TellToPlayer("-------------------------------------------------------------------------------------------");


	for pointNumber = 1, 9 do

		description = "<empty>";

		xPos  = player:getVar("@setpoint" .. pointNumber .. "_XPos");
		yPos  = player:getVar("@setpoint" .. pointNumber .. "_YPos");
		zPos  = player:getVar("@setpoint" .. pointNumber .. "_ZPos");
		zone  = player:getVar("@setpoint" .. pointNumber .. "_Zone");

		descA = decimalToHex(player:getVar("@setpoint" .. pointNumber .. "_DescA"));
		descB = decimalToHex(player:getVar("@setpoint" .. pointNumber .. "_DescB"));
		descC = decimalToHex(player:getVar("@setpoint" .. pointNumber .. "_DescC"));
		descD = decimalToHex(player:getVar("@setpoint" .. pointNumber .. "_DescD"));
		descE = decimalToHex(player:getVar("@setpoint" .. pointNumber .. "_DescE"));
		descF = decimalToHex(player:getVar("@setpoint" .. pointNumber .. "_DescF"));
		descG = decimalToHex(player:getVar("@setpoint" .. pointNumber .. "_DescG"));
		descH = decimalToHex(player:getVar("@setpoint" .. pointNumber .. "_DescH"));
		descI = decimalToHex(player:getVar("@setpoint" .. pointNumber .. "_DescI"));
		descJ = decimalToHex(player:getVar("@setpoint" .. pointNumber .. "_DescJ"));
		descK = decimalToHex(player:getVar("@setpoint" .. pointNumber .. "_DescK"));

		if (zone ~= 0) then

			description = "";	

			for x = 2, 88, 2 do
				if (x <= 8) then
					if (tonumber(descA) ~= 0) then
						if (string.sub(descA, x-1, x) ~= "") then
							description = description .. string.char(tonumber(string.sub(descA, x-1, x), 16));
						else
							break;
						end
					end
				elseif (x <= 16) then
					if (tonumber(descB) ~= 0) then
						if (string.sub(descB, x-9, x-8) ~= "") then
							description = description .. string.char(tonumber(string.sub(descB, x-9, x-8), 16));
						else
							break;
						end
					end
				elseif (x <= 24) then
					if (tonumber(descC) ~= 0) then
						if (string.sub(descC, x-17, x-16) ~= "") then
							description = description .. string.char(tonumber(string.sub(descC, x-17, x-16), 16));
						else
							break;
						end
					end
				elseif (x <= 32) then
					if (tonumber(descD) ~= 0) then
						if (string.sub(descD, x-25, x-24) ~= "") then
							description = description .. string.char(tonumber(string.sub(descD, x-25, x-24), 16));
						else
							break;
						end
					end
				elseif (x <= 40) then
					if (tonumber(descE) ~= 0) then
						if (string.sub(descE, x-33, x-32) ~= "") then
							description = description .. string.char(tonumber(string.sub(descE, x-33, x-32), 16));
						else
							break;
						end
					end
				elseif (x <= 48) then
					if (tonumber(descF) ~= 0) then
						if (string.sub(descF, x-41, x-40) ~= "") then
							description = description .. string.char(tonumber(string.sub(descF, x-41, x-40), 16));
						else
							break;
						end
					end
				elseif (x <= 56) then
					if (tonumber(descG) ~= 0) then
						if (string.sub(descG, x-49, x-48) ~= "") then
							description = description .. string.char(tonumber(string.sub(descG, x-49, x-48), 16));
						else
							break;
						end
					end
				elseif (x <= 64) then
					if (tonumber(descH) ~= 0) then
						if (string.sub(descH, x-57, x-56) ~= "") then
							description = description .. string.char(tonumber(string.sub(descH, x-57, x-56), 16));
						else
							break;
						end
					end
				elseif (x <= 72) then
					if (tonumber(descI) ~= 0) then
						if (string.sub(descI, x-65, x-64) ~= "") then
							description = description .. string.char(tonumber(string.sub(descI, x-65, x-64), 16));
						else
							break;
						end
					end
				elseif (x <= 80) then
					if (tonumber(descJ) ~= 0) then
						if (string.sub(descJ, x-73, x-72) ~= "") then
							description = description .. string.char(tonumber(string.sub(descJ, x-73, x-72), 16));
						else
							break;
						end
					end
				else --if (x <= 88) then
					if (tonumber(descK) ~= 0) then
						if (string.sub(descK, x-81, x-80) ~= "") then
							description = description .. string.char(tonumber(string.sub(descK, x-81, x-80), 16));
						else
							break;
						end
					end
				end
			end

			if (description == "") then
				description = "Set point " .. pointNumber  .. " is set in " .. getZoneName(zone) .. " at x: " .. xPos .. " y: " .. yPos .. " z: " .. zPos;
			else
				description = description .. " (" .. getZoneName(zone) .. ")";
			end

			
		end;

		player:TellToPlayer( pointNumber .. " = " .. description);
	end

	player:TellToPlayer("-------------------------------------------------------------------------------------------");
end;

function onTrigger(player,param1,param2,param3,param4,param5,param6,param7,param8,param9,paramA,paramC,paramD,paramE,paramF)

	if (param1 ~= nil) then

		param1 = string.lower(param1);

		if (param1 == "goto") then
			gotoPoint(player,param2);
		elseif (param1 == "list" or param1 == "view") then
			listPoints(player);
		elseif (param1 == "del" or param1 == "clear" or param1 == "rm") then
			delPoint(player,param2);
		else
			if (param3 ~= nil) then -- The multiple params are here to allow for spaces in the description.
				param2 = param2 .. " " .. param3;
			end
			if (param4 ~= nil) then
				param2 = param2 .. " " .. param4;
			end
			if (param5 ~= nil) then
				param2 = param2 .. " " .. param5;
			end
			if (param6 ~= nil) then
				param2 = param2 .. " " .. param6;
			end
			if (param7 ~= nil) then
				param2 = param2 .. " " .. param7;
			end
			if (param8 ~= nil) then
				param2 = param2 .. " " .. param8;
			end
			if (param9 ~= nil) then
				param2 = param2 .. " " .. param9;
			end
			if (paramA ~= nil) then
				param2 = param2 .. " " .. paramA;
			end
			if (paramB ~= nil) then
				param2 = param2 .. " " .. paramB;
			end
			if (paramC ~= nil) then
				param2 = param2 .. " " .. paramC;
			end
			if (paramD ~= nil) then
				param2 = param2 .. " " .. paramD;
			end
			if (paramE ~= nil) then
				param2 = param2 .. " " .. paramE;
			end
			if (paramF ~= nil) then
				param2 = param2 .. " " .. paramF;
			end

			createPoint(player,param1,param2);
		end
	else
		pointHelp(player);
	end
end;
-----------------------------------
--
-- 	Functions for Conquest system
-- 	
-----------------------------------

require("scripts/globals/common");

-----------------------------------
-- convenience constants
-----------------------------------

SANDORIA = 0;
  BASTOK = 1;
WINDURST = 2;  
BEASTMEN = 3;
OTHER    = 4;
JEUNO	 = 4;

       RONFAURE = 5;
       ZULKHEIM = 6;
      NORVALLEN = 7;
      GUSTABERG = 8;
       DERFLAND = 9;
   SARUTABARUTA = 10;
      KOLSHUSHU = 11;
       ARAGONEU = 12;
     FAUREGANDI = 13;
     VALDEAUNIA = 14;
    QUFIMISLAND = 15;
        LITELOR = 16;
         KUZOTZ = 17;
        VOLLBOW = 18;
ELSHIMOLOWLANDS = 19;
 ELSHIMOUPLANDS = 20;
          TULIA = 21;
     MOVALPOLOS = 22;
       TAVNAZIA = 23;

-----------------------------------------------------------------
-- getCP(player) returns a player's conquest points. 
-----------------------------------------------------------------

function getCP(player)
	return player:getVar("CP");
end;

-----------------------------------------------------------------
-- add_CP(player, amount) adds to a player's conquest points.
-----------------------------------------------------------------

function addCP(player,amount)
	cp = player:getVar("CP") + amount;
	player:setVar("CP",cp);
end;

-----------------------------------------------------------------
-- setCP(player) sets player's conquest points. 
-----------------------------------------------------------------

function setCP(player,amount)
	return player:setVar("CP",amount);
end;

-----------------------------------
-- Nation rank in conquest
-----------------------------------
	   
function getNationRank(nation)

	rank = 0;

	if(nation == BASTOK) then
		rank = 1;	
	elseif(nation == SANDORIA) then
		rank = 1;
	elseif(nation == WINDURST) then
		rank = 1;
	end

	return rank;
	
end

-----------------------------------
-- getRegionOwner(region)
-----------------------------------

function getRegionOwner(region)
	
	switch (region): caseof
	{
		[RONFAURE] = 		function (x) owner = SANDORIA; end,
		[ZULKHEIM] = 		function (x) owner = SANDORIA; end,
		[NORVALLEN] = 		function (x) owner = SANDORIA; end,
		[GUSTABERG] = 		function (x) owner = BASTOK; end,
		[DERFLAND] = 		function (x) owner = WINDURST; end,
		[SARUTABARUTA] = 	function (x) owner = WINDURST; end,
		[KOLSHUSHU] = 		function (x) owner = WINDURST; end,
		[ARAGONEU] = 		function (x) owner = SANDORIA; end,
		[FAUREGANDI] = 		function (x) owner = BASTOK; end,
		[VALDEAUNIA] = 		function (x) owner = WINDURST; end,
		[QUFIMISLAND] = 	function (x) owner = BASTOK; end,
		[LITELOR] = 		function (x) owner = BASTOK; end,
		[KUZOTZ] = 			function (x) owner = SANDORIA; end,
		[VOLLBOW] = 		function (x) owner = WINDURST; end,
		[ELSHIMOLOWLANDS] = function (x) owner = SANDORIA; end,
		[ELSHIMOUPLANDS] =  function (x) owner = WINDURST; end,
		[TULIA] = 			function (x) owner = WINDURST; end,
		[MOVALPOLOS] = 		function (x) owner = BEASTMEN; end,
		[TAVNAZIA] = 		function (x) owner = WINDURST; end,
		default = 			function (x) owner = OTHER; end,
	}
	
	return owner;
	
end;

---------------------------------
--
---------------------------------

function getRegionalConquestOverseers(region)

switch (region): caseof {
  ---------------------------------
  [RONFAURE] = function (x) -- West Ronfaure
  ---------------------------------
	--print("RONFAURE");

	npc  = {
	--
		17187488,SANDORIA,	-- Doladepaiton, R.K.
		17187495,SANDORIA,	-- Ballie, R.K.
		17187491,SANDORIA,	-- Flag 
		17187500,SANDORIA,	-- Flag
	--
		17187489,BASTOK,	-- Yoshihiro, I.M.
		17187496,BASTOK,	-- Molting Moth, I.M.
		17187492,BASTOK,	-- Flag 
		17187501,BASTOK,	-- Flag
	--
		17187497,WINDURST,	-- Tottoto, W.W.
		17187490,WINDURST,	-- Kyanta-Pakyanta, W.W.
		17187493,WINDURST,	-- Flag 	
		17187502,WINDURST,	-- Flag
	--
		17187494,BEASTMEN,	-- Flag 
		17187503,BEASTMEN,	-- Flag
	--
		17187498,OTHER,		-- Harvetour
	}	
  end,

  ---------------------------------
  [ZULKHEIM] = function (x) -- Valkurm_Dunes 
  ---------------------------------
	--print("ZULKHEIM");

	npc  = {
	-- 
		17199699,SANDORIA,	-- Quanteilleron, R.K.
		17199706,SANDORIA,	-- Prunilla, R.K. 	 
		17199702,SANDORIA,	-- flag
		17199711,SANDORIA,	-- flag
	-- 
		17199700,BASTOK,	-- Tsunashige, I.M.
		17199707,BASTOK,	-- Fighting Ant, I.M. 	
		17199703,BASTOK,	-- flag
		17199712,BASTOK,	-- flag
	-- 
		17199701,WINDURST,	-- Nyata-Mobuta, W.W.
		17199708,WINDURST,	-- Tebubu, W.W. 
		17199704,WINDURST,	-- flag
		17199713,WINDURST,	-- flag
	--
		17199705,BEASTMEN,	-- flag
		17199714,BEASTMEN,	-- flag
		17199719,BEASTMEN,	-- flag
	--	
		17199709,OTHER,		-- Medicine Axe
	}
  end,

  ---------------------------------
  [NORVALLEN] = function (x) -- Jugner_Forest
  ---------------------------------
	--print("NORVALLEN");
	
	npc  = {
	-- 
		17203838,SANDORIA,	-- Chaplion, R.K.
		17203845,SANDORIA,	-- Taumiale, R.K. 
		17203841,SANDORIA,	-- flag
	    17203849,SANDORIA,	-- flag
	-- 
		17203839,BASTOK,	-- Takamoto, I.M.
		17203846,BASTOK,	-- Pure Heart, I.M. 
		17203842,BASTOK,	-- flag
		17203850,BASTOK,	-- flag
	-- 
		17203840,WINDURST,	-- Bubchu-Bibinchu, W.W.
		17203847,WINDURST,	-- Geruru, W.W.  
		17203843,WINDURST,	-- flag
		17203851,WINDURST,	-- flag
	-- 
		17203844,BEASTMEN,	-- flag
	    17203852,BEASTMEN,	-- flag
	    17203863,BEASTMEN,	-- flag
	--
		17203848,OTHER,		-- Mionie
	} 
  end,
  
  ---------------------------------
  [GUSTABERG] = function (x) -- North_Gustaberg
  ---------------------------------
	--print("GUSTABERG");

	npc  = {
	-- 
		17212023,SANDORIA,	-- Ennigreaud, R.K.
		17212030,SANDORIA,	-- Quellebie, R.K.  
		17212026,SANDORIA,	-- flag
	    17212034,SANDORIA,	-- flag
	-- 
		17212024,BASTOK,	-- Shigezane, I.M.
		17212031,BASTOK,	-- Heavy Fog, I.M.  
		17212027,BASTOK,	-- flag
		17212035,BASTOK,	-- flag
	-- 
		17212025,WINDURST,	-- Kuuwari-Aori, W.W.
		17212032,WINDURST,	-- Butsutsu, W.W.
		17212028,WINDURST,	-- flag
		17212036,WINDURST,	-- flag
	-- 
		17212029,BEASTMEN,	-- flag
	    17212037,BEASTMEN,	-- flag
	--
		17212033,OTHER,		-- Kuleo
	}
  end,
  
  ---------------------------------
  [DERFLAND] = function (x) -- Pashhow_Marshlands
  ---------------------------------
	--print("DERFLAND");
  
	npc  = {
	-- 
		17224316,SANDORIA,	-- Mesachedeau, R.K.
		17224323,SANDORIA,	-- Ioupie, R.K. 
		17224319,SANDORIA,	-- flag
		17224327,SANDORIA,	-- flag
	-- 
		17224317,BASTOK,	-- Souun, I.M.
		17224324,BASTOK,	-- Sharp Tooth, I.M. 
		17224320,BASTOK,	-- flag
		17224328,BASTOK,	-- flag
	-- 
		17224318,WINDURST,	-- Mokto-Lankto, W.W.
		17224325,WINDURST,	-- Shikoko, W.W. 
		17224321,WINDURST,	-- flag
		17224329,WINDURST,	-- flag
	-- 
		17224322,BEASTMEN,	-- flag
	    17224330,BEASTMEN,	-- flag
	    17224336,BEASTMEN,	-- flag
	--
		17224326,OTHER,		-- Tahmasp
	}
  end,
  
  ---------------------------------
  [SARUTABARUTA] = function (x) -- West_Sarutabaruta
  ---------------------------------
	--print("SARUTABARUTA");
	
	npc  = {
	-- 
		17248788,SANDORIA,	-- Naguipeillont, R.K.
		17248795,SANDORIA,	-- Banege, R.K. 
		17248791,SANDORIA,	-- flag
		17248799,SANDORIA,	-- flag
	-- 
		17248789,BASTOK,	-- Ryokei, I.M.
		17248796,BASTOK,	-- Slow Axe, I.M.
		17248792,BASTOK,	-- flag
		17248800,BASTOK,	-- flag
	-- 
		17248790,WINDURST,	-- Roshina-Kuleshuna, W.W.
		17248797,WINDURST,	-- Darumomo, W.W. 
		17248793,WINDURST,	-- flag
		17248801,WINDURST,	-- flag
	-- 
		17248794,BEASTMEN,	-- flag
	    17248802,BEASTMEN,	-- flag
	--
		17248798,OTHER,		-- Mahien-Uhien
	}	
  end,
  
  ---------------------------------
  [KOLSHUSHU] = function (x) -- Buburimu_Peninsula
  ---------------------------------
	--print("KOLSHUSHU");

	npc  = {
	-- 
		17261139,SANDORIA,	-- Bonbavour, R.K. 
		17261146,SANDORIA,	-- Craigine, R.K.
		17261142,SANDORIA,	-- flag	
		17261150,SANDORIA,	-- flag
	-- 
		17261140,BASTOK,	-- Ishin, I.M. 
		17261147,BASTOK,	-- Wise Turtle, I.M.
		17261143,BASTOK,	-- flag
		17261152,BASTOK,	-- flag
	-- 
		17261141,WINDURST,	-- Ganemu-Punnemu, W.W.
		17261148,WINDURST,	-- Mashasha, W.W.
		17261144,WINDURST,	-- flag	
		17261152,WINDURST,	-- flag	
	-- 
		17261145,BEASTMEN,	-- flag
		17261153,BEASTMEN,	-- flag
	    17261173,BEASTMEN,	-- flag
	--
		17261149,OTHER,		-- Lobho Ukipturi
	}	
  end,
  
  ---------------------------------
  [ARAGONEU] = function (x) -- Meriphataud_Mountains
  ---------------------------------
	--print("ARAGONEU");

	npc  = {
	-- 
		17265261,SANDORIA,	-- Chegourt, R.K.
		17265268,SANDORIA,	-- Buliame, R.K. 
		17265264,SANDORIA,	-- flag
		17265272,SANDORIA,	-- flag
	-- 
		17265262,BASTOK,	-- Akane, I.M.
		17265269,BASTOK,	-- Three Steps, I.M.  
		17265265,BASTOK,	-- flag
		17265273,BASTOK,	-- flag
	-- 
		17265263,WINDURST,	-- Donmo-Boronmo, W.W.
		17265270,WINDURST,	-- Daruru, W.W. 
		17265266,WINDURST,	-- flag
		17265274,WINDURST,	-- flag
	-- 
		17265267,BEASTMEN,	-- flag
	    17265275,BEASTMEN,	-- flag
	    17265277,BEASTMEN,	-- flag
	--
		17265271,OTHER,		-- Mushosho
	}	
  end,
  
  ---------------------------------
  [FAUREGANDI] = function (x) -- Beaucedine_Glacier
  ---------------------------------
	--print("FAUREGANDI");

	npc  = {
	-- 
		17232196,SANDORIA,	-- Parledaire, R.K.
		17232203,SANDORIA,	-- Leaufetie, R.K. 
		17232199,SANDORIA,	-- flag
		17232207,SANDORIA,	-- flag
	-- 
		17232197,BASTOK,	-- Akane, I.M.
		17232204,BASTOK,	-- Rattling Rain, I.M. 
		17232200,BASTOK,	-- flag
		17232208,BASTOK,	-- flag
	-- 
		17232198,WINDURST,	-- Ryunchi-Pauchi, W.W.
		17232205,WINDURST,	-- Chopapa, W.W. 
		17232201,WINDURST,	-- flag 
		17232209,WINDURST,	-- flag
	-- 
		17232202,BEASTMEN,	-- flag
	    17232210,BEASTMEN,	-- flag
	    17232215,BEASTMEN,	-- flag
	--
		17232206,OTHER,		-- Gueriette
	}	
  end,
  
  ---------------------------------
  [VALDEAUNIA] = function (x) -- Xarcabard
  ---------------------------------
	--print("VALDEAUNIA");

	npc  = {
	-- 
		17236279,SANDORIA,	-- Jeantelas, R.K.
		17236286,SANDORIA,	-- Pilcha, R.K.  
		17236282,SANDORIA,	-- flag
		17236290,SANDORIA,	-- flag
	-- 
		17236280,BASTOK,	-- Kaya, I.M.
		17236287,BASTOK,	-- Heavy Bear, I.M. 
		17236283,BASTOK,	-- flag 
		17236291,BASTOK,	-- flag
	-- 
		17236281,WINDURST,	-- Magumo-Yagimo, W.W.
		17236288,WINDURST,	-- Tememe, W.W. 
		17236284,WINDURST,	-- flag
		17236292,WINDURST,	-- flag
	-- 
		17236285,BEASTMEN,	-- flag
	    17236293,BEASTMEN,	-- flag
	    17236310,BEASTMEN,	-- flag
	--
		17236289,OTHER,		-- Pelogrant
	}	
  end,
  
  ---------------------------------
  [QUFIMISLAND] = function (x) -- Qufim_Island
  ---------------------------------
	--print("QUFIMISLAND");

	npc  = {
	-- 
		17293704,SANDORIA,	-- Pitoire, R.K.
		17293711,SANDORIA,	-- Matica, R.K. 
		17293707,SANDORIA,	-- flag
		17293715,SANDORIA,	-- flag
	-- 
		17293705,BASTOK,	-- Sasa, I.M.
		17293712,BASTOK,	-- Singing Blade, I.M. 
		17293708,BASTOK,	-- flag
		17293716,BASTOK,	-- flag
	--
		17293706,WINDURST,	-- Tsonga-Hoponga, W.W.
		17293713,WINDURST,	-- Numumu, W.W.
		17293709,WINDURST,	-- flag
		17293717,WINDURST,	-- flag
	-- 
		17293710,BEASTMEN,	-- flag
		17293718,BEASTMEN,	-- flag
		17293734,BEASTMEN,	-- flag
	--
		17293714,OTHER,		-- Jiwon
	}
  end,
  
  ---------------------------------
  [LITELOR] = function (x) -- The_Sanctuary_of_ZiTah
  ---------------------------------
	--print("LITELOR");
	
	npc  = {
	-- 
		17273350,SANDORIA,	-- Credaurion, R.K.
		17273357,SANDORIA,	-- Limion, R.K.
		17273344,SANDORIA,	-- flag
		17273353,SANDORIA,	-- flag
		17273361,SANDORIA,	-- flag
	-- 
		17273351,BASTOK,	-- Calliope, I.M.
		17273358,BASTOK,	-- Dedden, I.M. 
		17273354,BASTOK,	-- flag
		17273362,BASTOK,	-- flag
	-- 
		17273352,WINDURST,	-- Ajimo-Majimo, W.W.
		17273359,WINDURST,	-- Ochocho, W.W. 
		17273355,WINDURST,	-- flag
		17273363,WINDURST,	-- flag
	-- 
		17273356,BEASTMEN,	-- flag
		17273364,BEASTMEN,	-- flag
		17273380,BEASTMEN,	-- flag
	--	
		17273360,OTHER,		-- Kasim
	}
  end,
  
  ---------------------------------
  [KUZOTZ] = function (x) -- Eastern_Altepa_Desert
  ---------------------------------
	--print("KUZOTZ");

	npc  = {
	-- 
		17244619,SANDORIA,	-- Eaulevisat, R.K.
		17244626,SANDORIA,	-- Laimeve, R.K.  
		17244622,SANDORIA,	-- flag
		17244630,SANDORIA,	-- flag
	-- 
		17244620,BASTOK,	-- Lindgard, I.M.
		17244627,BASTOK,	-- Daborn, I.M. 
		17244623,BASTOK,	-- flag
		17244631,BASTOK,	-- flag
	-- 
		17244621,WINDURST,	-- Variko-Njariko, W.W.
		17244628,WINDURST,	-- Sahgygy, W.W. 
		17244624,WINDURST,	-- flag
		17244632,WINDURST,	-- flag
	-- 
		17244625,BEASTMEN,	-- flag
		17244633,BEASTMEN,	-- flag
	    17244640,BEASTMEN,	-- flag
	--
		17244629,OTHER,		-- Sowande
	}	
  end,
  
  ---------------------------------
  [VOLLBOW] = function (x) -- Cape_Teriggan
  ---------------------------------
	--print("VOLLBOW");
	
	npc  = {
	-- 
		17240463,SANDORIA,	-- Salimardi, R.K.
		17240470,SANDORIA,	-- Paise, R.K. 
		17240466,SANDORIA,	-- flag
		17240474,SANDORIA,	-- flag
	-- 
		17240464,BASTOK,	-- Sarmistha, I.M.
		17240471,BASTOK,	-- Dultwa, I.M. 
		17240467,BASTOK,	-- flag
		17240475,BASTOK,	-- flag
	-- 
		17240465,WINDURST,	-- Voranbo-Natanbo, W.W.
		17240472,WINDURST,	-- Orukeke, W.W. 
		17240468,WINDURST,	-- flag
		17240476,WINDURST,	-- flag
	-- 
		17240469,BEASTMEN,	-- flag
	    17240477,BEASTMEN,	-- flag 
	    17240487,BEASTMEN,	-- flag
	--
		17240473,OTHER,		-- Bright Moon
	}	
  end,
  
  ---------------------------------
  [ELSHIMOLOWLANDS] = function (x) -- Yuhtunga_Jungle 
  ---------------------------------
	--print("ELSHIMOLOWLANDS");

	npc  = {
	-- 
		17281578,SANDORIA,	-- Zorchorevi, R.K.
		17281585,SANDORIA,	-- Mupia, R.K. 
		17281581,SANDORIA,	-- flag
		17281589,SANDORIA,	-- flag
	-- 
		17281579,BASTOK,	-- Mahol, I.M.
		17281586,BASTOK,	-- Bammiro, I.M. 
		17281582,BASTOK,	-- flag
		17281590,BASTOK,	-- flag
	-- 
		17281580,WINDURST,	-- Uphra-Kophra, W.W.
		17281587,WINDURST,	-- Richacha, W.W. 
		17281583,WINDURST,	-- flag
		17281591,WINDURST,	-- flag
	-- 
		17281584,BEASTMEN,	-- flag
		17281592,BEASTMEN,	-- flag
		17281613,BEASTMEN,	-- flag
	--
		17281588,OTHER,		-- Robino-Mobino
	}
  end,
  
  ---------------------------------
  [ELSHIMOUPLANDS] = function (x) -- Yhoator_Jungle
  ---------------------------------
	--print("ELSHIMOUPLANDS");

	npc  ={
	-- 
		17285642,SANDORIA,	-- Ilieumort, R.K.
		17285649,SANDORIA,	-- Emila, R.K. 
		17285645,SANDORIA,	-- flag
		17285653,SANDORIA,	-- flag
	-- 
		17285643,BASTOK,	-- Mintoo, I.M.
		17285650,BASTOK,	-- Guddal, I.M.  
		17285646,BASTOK,	-- flag
		17285654,BASTOK,	-- flag
	-- 
		17285644,WINDURST,	-- Etaj-Pohtaj, W.W.
		17285651,WINDURST,	-- Ghantata, W.W. 
		17285647,WINDURST,	-- flag
		17285655,WINDURST,	-- flag
	-- 
		17285648,BEASTMEN,	-- flag
		17285656,BEASTMEN,	-- flag
		17285673,BEASTMEN,	-- flag
	--
		17285652,OTHER,		-- Mugha Dovajaiho
	}
  end,
  
  ---------------------------------
  [TULIA] = function (x) -- RuAun_Gardens
  ---------------------------------
	--print("TULIA");

	npc  = {
	-- 
		17310061,SANDORIA,	-- flag
	-- 
		17310062,BASTOK,	-- flag
	-- 
		17310063,WINDURST,	-- flag
	-- 
		17310064,BEASTMEN,	-- flag
	}
  end,
  
  ---------------------------------
  [MOVALPOLOS] = function (x) -- Oldton_Movalpolos
  ---------------------------------
	--print("MOVALPOLOS");
	
	npc  = {
	-- 
		16822506,SANDORIA,	-- flag
	-- 
		16822507,BASTOK,	-- flag
	-- 
		16822508,WINDURST,	-- flag
	-- 
		16822509,BEASTMEN,	-- flag
	}		
  end,
  
  ---------------------------------
  [TAVNAZIA] = function (x) -- Lufaise_Meadows
  ---------------------------------
	--print("TAVNAZIA");
	
	npc  = {
	-- 
		16875816,SANDORIA,	-- Jemmoquel, R.K.
		16875823,SANDORIA,	-- Chilaumme, R.K.
		16875819,SANDORIA,	-- flag
		16875827,SANDORIA,	-- flag
	-- 
		16875817,BASTOK,	-- Yoram, I.M.
		16875824,BASTOK,	-- Ghost Talker, I.M. 
		16875820,BASTOK,	-- flag
		16875828,BASTOK,	-- flag
	-- 
		16875818,WINDURST,	-- Teldo-Moroldo, W.W.
		16875825,WINDURST,	-- Cotete, W.W.
		16875821,WINDURST,	-- flag		
		16875829,WINDURST,	-- flag
	-- 
		16875822,BEASTMEN,	-- flag
        16875830,BEASTMEN,	-- flag
	--
		16875826,OTHER,		-- Jersey
	}
  end,} 

 return npc;

end;

-----------------------------------
--
-----------------------------------

function SetRegionalConquestOverseers()

region = 5;

	while region <= 23 do

	npclist = getRegionalConquestOverseers(region);
	nation  = getRegionOwner(region);

		i = 1;
		while i <= (table.getn(npclist)) do
			
			if(npclist[i+1] == nation) then
				npc = GetNPCByID(npclist[i]);
				npc:setStatus(0);
			else
				npc = GetNPCByID(npclist[i]);
				npc:setStatus(2);
			end
		
			if(npclist[i+1] == OTHER) then
				if(nation ~= BEASTMEN) then
					npc = GetNPCByID(npclist[i]);
					npc:setStatus(0);
				else
					npc = GetNPCByID(npclist[i]);
					npc:setStatus(2);
				end
			end

			i = i + 2;
		end

	region =  region + 1;		
	end

end;
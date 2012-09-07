-----------------------------------
-- Area: Dynamis San d'Oria
-- NPC:  Serjeant Tombstone
-- Map1 Position: http://www.dynamislounge.com/html/zone/frame_san1.htm
-- Map2 Position: http://www.dynamislounge.com/html/zone/frame_san2.htm
-----------------------------------
package.loaded["scripts/zones/Dynamis-San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Dynamis-San_dOria/TextIDs");

--  1: WAR Vanguard Footsoldier
--  2: MNK Vanguard Grappler
--  3: WHM Vanguard Amputator
--  4: BLM Vanguard Mesmerizer
--  5: RDM Vanguard Vexer
--  6: THF Vanguard Pillager
--  7: PLD Vanguard Trooper
--  8: DRK Vanguard Neckchopper
--  9: BST Vanguard Hawker + Vanguard's Hecteyes
-- 10: BRD Vanguard Bugler
-- 11: RNG Vanguard Predator
-- 12: SAM Vanguard Gutslasher
-- 13: NIN Vanguard Backstabber
-- 14: DRG Vanguard Impaler + Vanguard's Wyvern
-- 15: SMN Vanguard Dollmaster + Vanguard's Avatar

-- [Position on the map] Adamantking mobid, {spawnlist: mob1, mob2,...}
spawnList = {--[[001]] 17535250,{1,1},			--[[002]] 17535251,{2},				--[[003]] 17535252,{2},			--[[004]] 17535253,{5},
			 --[[005]] 17535254,{5},			--[[006]] 17535255,{2,2,2},			--[[008]] 17535257,{7,8},		--[[009]] 17535258,{1,1},
			 --[[010]] 17535259,{5,5},			--[[011]] 17535260,{14,14},			--[[012]] 17535261,{3,3},		--[[013]] 17535262,{6,6},
			 --[[014]] 17535263,{13,13},		--[[015]] 17535264,{12,12},			--[[017]] 17535266,{2,4,4},		--[[018]] 17535267,{17535026},
			 --[[019]] 17535026,{9,4,4},		--[[020]] 17535268,{17535057},		--[[021]] 17535057,{7,11,11},	--[[022]] 17535269,{6},
			 --[[023]] 17535270,{3,4},			--[[024]] 17535271,{6},				--[[025]] 17535272,{6,10},		--[[026]] 17535273,{6,10},
			 --[[027]] 17535274,{6,10},			--[[029]] 17535276,{11,11},			--[[030]] 17535277,{3,3},		--[[032]] 17535279,{8,8,17535032},
			 --[[036]] 17535003,{6,6,10},		--[[037]] 17535283,{12,12},			--[[038]] 17535284,{9,9},		--[[039]] 17535285,{11,11},
			 --[[040]] 17535286,{13,13},		--[[041]] 17535287,{15,15},			--[[042]] 17535288,{15,15},		--[[043]] 17535289,{15,15},
			 --[[044]] 17535290,{15,15},		--[[045]] 17535291,{11,11},			--[[046]] 17535292,{13,13},		--[[047]] 17535293,{9,9},
			 --[[048]] 17535294,{12,12},		--[[049]] 17535295,{2,1},			--[[050]] 17535296,{3},			--[[051]] 17535297,{7,1,1},
			 --[[052]] 17535298,{11,11},		--[[053]] 17535299,{2,1},			--[[054]] 17535300,{3},			--[[055]] 17535301,{3},
			 --[[056]] 17535302,{6,6},			--[[057]] 17535303,{3},				--[[058]] 17535304,{7,7},		--[[061]] 17535004,{2,2,10},
			 --[[063]] 17535308,{8,8},			--[[064]] 17535309,{14,14},			--[[065]] 17535310,{9,9},		--[[069]] 17535314,{5,5},
			 --[[070]] 17535315,{2,2,17535006},	--[[071]] 17535316,{4,4},			--[[073]] 17535318,{12,12},		--[[074]] 17535319,{12,13},
			 --[[075]] 17535320,{13,13},		--[[076]] 17535321,{3,3,11,11,11},	--[[077]] 17535322,{8,8},		--[[078]] 17535323,{4,4},
			 --[[079]] 17535324,{3,3},			--[[080]] 17535325,{5,5},			--[[081]] 17535326,{9,9},		--[[082]] 17535327,{9},
			 --[[083]] 17535328,{9,9},			--[[085]] 17535331,{9,9},			--[[087]] 17535332,{5,5,4,4},	--[[088]] 17535333,{7,7},
			 --[[089]] 17535334,{11,11,11},		--[[090]] 17535335,{8,8},			--[[091]] 17535336,{5,1,1},		--[[092]] 17535337,{10,10},
			 --[[093]] 17535338,{17535044,17535005,17535113},						--[[094]] 17535005,{13,13},		--[[095]] 17535113,{13,13},--[[096]] 17535339,{14,14},
			 --[[097]] 17535340,{11,11},		--[[098]] 17535341,{14,14},			--[[099]] 17535342,{17535114,17535115},--[[100]] 17535114,{10},
			 --[[101]] 17535115,{10},			--[[102]] 17535343,{14,14,1,1},		--[[104]] 17535345,{7,7},		--[[105]] 17535346,{8,8,5,5},
			 --[[106]] 17535347,{1,1,7,7},		--[[107]] 17535348,{13,13},			--[[108]] 17535349,{12,12},		--[[110]] 17535350,{15,15,15},
			 --[[111]] 17535355,{14,14,14},		--[[116]] 17535356,{8,8,8,4,4},		--[[117]] 17535357,{9,9,9},		--[[118]] 17535358,{12,12,5,5,10,10},
			 --[[119]] 17535359,{7,7,7,6,6},	--[[120]] 17535360,{14,14,14},		--[[121]] 17535361,{1,1,3,3},	--[[122]] 17535362,{2,2,2,3,3},
			 --[[123]] 17535363,{15,15,10,10},	--[[124]] 17535364,{14,14,14},		--[[125]] 17535365,{15,15},		--[[126]] 17535366,{13,13,13,13},
			 --[[127]] 17535367,{12,12,12},		--[[128]] 17535368,{11,11,11},		--[[129]] 17535369,{10,10,10},	--[[130]] 17535370,{6,6,6,10,10},
			 --[[131]] 17535371,{12,12,5,5,4,4},--[[132]] 17535372,{6,6,6},			--[[133]] 17535373,{9,9,9},		--[[134]] 17535374,{8,8,8},
			 --[[135]] 17535375,{7,7,7},		--[[136]] 17535376,{5,5,5},			--[[137]] 17535377,{3,3,3},		--[[138]] 17535378,{2,2,2},
			 --[[139]] 17535379,{1,1,1},		--[[140]] 17535380,{4,4,4},			--[[141]] 17535381,{12},		--[[142]] 17535382,{12},
			 --[[143]] 17535383,{2},			--[[144]] 17535384,{2},				--[[145]] 17535385,{8,8,8},		--[[146]] 17535386,{7,7,7},
			 --[[147]] 17535387,{15,15,17535390},--[[149]] 17535389,{15,15,17535388}};

function getListDynaMob(thismob)
	
	switch (thismob) : caseof {
	 [1] = function (x) mobList = {17534980,17535000,17535012,17535016,17535034,17535058,17535085,17535098}; end, 
	 [2] = function (x) mobList = {17534986,17535001,17535017,17535035,17535059,17535079,17535091}; end, 
	 [3] = function (x) mobList = {17534982,17535009,17535018,17535045,17535060,17535086,17535099}; end, 
	 [4] = function (x) mobList = {17534985,17534988,17535046,17535051,17535061,17535080}; end, 
	 [5] = function (x) mobList = {17534983,17534998,17535024,17535047,17535055,17535062}; end, 
	 [6] = function (x) mobList = {17534984,17535021,17535036,17535054,17535063,17535081}; end, 
	 [7] = function (x) mobList = {17534981,17535008,17535019,17535025,17535037,17535056,17535064,17535084}; end, 
	 [8] = function (x) mobList = {17534987,17535020,17535038,17535053,17535065,17535087}; end, 
	 [9] = function (x) mobList = {17534994,17535028,17535066,17535076,17535094}; end, 
	[10] = function (x) mobList = {17534989,17535022,17535027,17535048,17535052,17535068,17535078,17535088,17535100}; end, 
	[11] = function (x) mobList = {17534999,17535002,17535023,17535039,17535069,17535089,17535093,17535101}; end, 
	[12] = function (x) mobList = {17534990,17535030,17535040,17535070,17535082,17535092}; end, 
	[13] = function (x) mobList = {17534993,17535013,17535031,17535041,17535071,17535083,17535090,17535102}; end, 
	[14] = function (x) mobList = {17534991,17535014,17535042,17535072,17535096}; end, 
	[15] = function (x) mobList = {17534996,17535010,17535049,17535074}; end, 
	}
	
	return mobList;

end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
	printf("1");
	mobID = mob:getID();
	X = mob:getXPos();
	Y = mob:getYPos();
	Z = mob:getZPos();
	printf("1");
	for nb = 1, table.getn(spawnList), 2 do
		if(mobID == spawnList[nb]) then
			for nbi = 1, table.getn(spawnList[nb + 1]), 1 do
				if((nbi % 2) == 0) then X=X+2; Z=Z+2; else X=X-2; Z=Z-2; end
				printf("2");
				if(spawnList[nb + 1][nbi] <= 20) then
					printf("3");
					mobList = getListDynaMob(spawnList[nb + 1][nbi]);
					for nbo = 1, table.getn(mobList), 1 do
						printf("4");
						if(GetMobAction(mobList[nbo]) == 0) then
							-- Spawn Mob
							SpawnMob(mobList[nbo]):updateEnmity(target);
							GetMobByID(mobList[nbo]):setPos(X,Y,Z);
							-- Spawn Pet for BST, DRG, and SMN
							if(spawnList[nb + 1][nbi] == 9 or spawnList[nb + 1][nbi] == 14 or spawnList[nb + 1][nbi] == 15) then
								SpawnMob(mobList[nbo] + 1):updateEnmity(target);
								GetMobByID(mobList[nbo] + 1):setPos(X,Y,Z);
							end
							break;
						end
					end
				elseif(spawnList[nb + 1][nbi] > 20) then
					-- Spawn NM
					SpawnMob(spawnList[nb + 1][nbi]):updateEnmity(target);
					GetMobByID(spawnList[nb + 1][nbi]):setPos(X,Y,Z);
					MJob = GetMobByID(spawnList[nb + 1][nbi]):getMainJob();
					if(MJob == 9 or MJob == 14 or MJob == 15) then
						-- Spawn Pet for BST, DRG, and SMN
						SpawnMob(spawnList[nb + 1][nbi] + 1):updateEnmity(target);
						GetMobByID(spawnList[nb + 1][nbi] + 1):setPos(X,Y,Z);
					end
				end
			end
		end
	end
	
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	mobID = mob:getID();
	-- Time Bonus (10min): 074
	if(mobID == 17535319) then
		killer:addTimeToDynamis(10);
	-- Time Bonus (15min): 007 009
	elseif(mobID == 17535256 or mobID == 17535258) then
		killer:addTimeToDynamis(15);
	-- Time Bonus (25min): 026 064
	elseif(mobID == 17535273 or mobID == 17535309) then
		killer:addTimeToDynamis(25);
	-- Time Bonus (30min): 041
	elseif(mobID == 17535287) then
		killer:addTimeToDynamis(30);
	-- HP Bonus: 012 015 034 044 052 059 072 073 078 081 083 091 097 103 104 107 | 
	elseif(mobID == 17535261 or mobID == 17535264 or mobID == 17535281 or mobID == 17535290 or mobID == 17535298 or mobID == 17535305 or mobID == 17535317 or mobID == 17535318 or
		   mobID == 17535323 or mobID == 17535326 or mobID == 17535328 or mobID == 17535336 or mobID == 17535340 or mobID == 17535344 or mobID == 17535345 or mobID == 17535348) then 
		killer:addHP(2000);
		killer:messageBasic(024,(killer:getMaxHP()-killer:getHP()));
	-- MP Bonus: 006 010 014 032 035 038 047 060 062 070 076 079 084 086 092 108 | 
	elseif(mobID == 17535255 or mobID == 17535259 or mobID == 17535263 or mobID == 17535279 or mobID == 17535282 or mobID == 17535284 or mobID == 17535293 or mobID == 17535306 or 
		   mobID == 17535307 or mobID == 17535315 or mobID == 17535321 or mobID == 17535324 or mobID == 17535329 or mobID == 17535331 or mobID == 17535337 or mobID == 17535349) then 
		killer:addMP(2000);
		killer:messageBasic(025,(killer:getMaxMP()-killer:getMP()));
	-- Special
	elseif(mobID == 17535352) then
		SpawnMob(17535353);
	elseif(mobID == 17535354) then
		SpawnMob(17535355);
	end
	
end;
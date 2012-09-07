-----------------------------------
-- Area: Dynamis Bastok
-- NPC:  Adamantking Effigy
-- Map Position: http://www.dynamislounge.com/html/zone/frame_bas1.htm
-- Map Position: http://www.dynamislounge.com/html/zone/frame_bas2.htm
-----------------------------------
package.loaded["scripts/zones/Dynamis-Bastok/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Dynamis-Bastok/TextIDs");

--  1: BST Vanguard Beasttender + Vanguard's Scorpion
--  2: WHM Vanguard Constable
--  3: PLD Vanguard Defender
--  4: DRG Vanguard Drakekeeper + Vanguard's Wyvern
--  5: SAM Vanguard Hatamoto
--  6: NIN Vanguard Kusa
--  7: RNG Vanguard Mason
--  8: MNK Vanguard Militant
--  9: BRD Vanguard Minstrel
-- 10: RDM Vanguard Protector
-- 11: THF Vanguard Purloiner
-- 12: BLM Vanguard Thaumaturge
-- 13: SMN Vanguard Undertaker + Vanguard's Avatar
-- 14: DRK Vanguard Vigilante
-- 15: WAR Vanguard Vindicator

-- [Position on the map] Adamantking mobid, {spawnlist: mob1, mob2,...}
spawnList = {--[[001]] 17539350,{6,12},		--[[002]] 17539351,{5,9},		--[[003]] 17539352,{10,15},		--[[004]] 17539353,{11,15},		--[[005]] 17539354,{4,9},
			 --[[006]] 17539355,{1,1},		--[[007]] 17539356,{1,1},		--[[008]] 17539357,{1,1},		--[[009]] 17539358,{5,9},		--[[010]] 17539359,{5,9},
			 --[[011]] 17539360,{6,12,15},	--[[012]] 17539361,{4,5,9},		--[[013]] 17539362,{2,6},		--[[014]] 17539363,{12,14},		--[[016]] 17539364,{10},
			 --[[018]] 17539367,{11},		--[[020]] 17539369,{14,6,12},	--[[021]] 17539370,{4,10},		--[[022]] 17539371,{12,5},		--[[023]] 17539372,{14,9},
			 --[[024]] 17539373,{7,8},		--[[025]] 17539374,{2,15,17539118},--[[027]] 17539375,{10,11},	--[[028]] 17539376,{6,3,5,15,12,9,17539119,17539120,17539161},
			 --[[032]] 17539377,{6,14,2},	--[[033]] 17539378,{11,15},		--[[034]] 17539379,{2,5},		--[[035]] 17539380,{3,8,9},		--[[036]] 17539381,{3,8,10},
			 --[[037]] 17539382,{3,6,10},	--[[039]] 17539383,{1,1,1},		--[[040]] 17539384,{13},		--[[042]] 17539387,{1,1,1},		--[[043]] 17539388,{5,12},
			 --[[044]] 17539389,{11,15,14},	--[[045]] 17539390,{15,8,10},	--[[046]] 17539391,{15,5,10},	--[[047]] 17539392,{14,8,10},	--[[048]] 17539393,{3,11,10},
			 --[[049]] 17539394,{6},		--[[050]] 17539395,{15,9},		--[[051]] 17539396,{4,6,10},	--[[052]] 17539397,{14,5,9},	--[[053]] 17539398,{2,17539162,17539188},
			 --[[055]] 17539399,{2,17539143},--[[056]] 17539400,{13},		--[[057]] 17539401,{13},		--[[058]] 17539402,{15,8,2},	--[[059]] 17539403,{15,11},
			 --[[060]] 17539404,{14,8,2},	--[[061]] 17539405,{3,8,2},		--[[062]] 17539406,{2},			--[[063]] 17539407,{14,8,2},	--[[064]] 17539408,{3,14,1},
			 --[[065]] 17539409,{14,8,9},	--[[066]] 17539410,{15,11,10},	--[[068]] 17539412,{3,5,12},	--[[069]] 17539413,{2,17539190},--[[070]] 17539414,{7,7},
			 --[[071]] 17539415,{7},		--[[072]] 17539416,{4,11},		--[[073]] 17539417,{14,5},		--[[075]] 17539419,{3,6},		--[[076]] 17539420,{15,9},
			 --[[077]] 17539421,{4,12},		--[[078]] 17539422,{3,8,12},	--[[079]] 17539423,{14,8,12},	--[[082]] 17539426,{6},			--[[083]] 17539427,{3,6},
			 --[[086]] 17539430,{15,6},		--[[087]] 17539431,{14,5,9},	--[[088]] 17539432,{8,8,14,17539163,12,7,7},--[[089]] 17539163,{17539300,17539301,17539304}, --[[090]] 17539433,{3,2},
			 --[[091]] 17539434,{2,17539147},--[[093]] 17539435,{4,11,2},	--[[095]] 17539437,{3,11},		--[[096]] 17539438,{6,10},		--[[097]] 17539439,{11,12},
			 --[[098]] 17539440,{6,9},		--[[099]] 17539441,{14,9},		--[[100]] 17539442,{3,10},		--[[101]] 17539443,{4,5},		--[[102]] 17539444,{11},
			 --[[105]] 17539447,{5,10},		--[[106]] 17539448,{6,12},		--[[107]] 17539449,{4,8},		--[[108]] 17539450,{4,10},		--[[109]] 17539451,{3,12}
			 };
----[[011]] 00000000,{},--[[012]] 00000000,{},--[[013]] 00000000,{},--[[014]] 00000000,{},--[[015]] 00000000,{},
-- Need to add :
-- 39/42 random nm spawn with 3 BST

function getListDynaMob(thismob)

	switch (thismob) : caseof {
	 [1] = function (x) mobList = {17539076,17539110,17539177,17539197,17539213,17539237,17539247,17539284}; end, 
	 [2] = function (x) mobList = {17539084,17539101,17539125,17539182,17539187,17539193,17539243,17539245,17539268,17539269,17539304}; end, 
	 [3] = function (x) mobList = {17539082,17539103,17539104,17539103,17539127,17539176,17539184,17539189,17539196,17539226,17539233,17539256,17539278}; end, 
	 [4] = function (x) mobList = {17539088,17539105,17539112,17539164,17539199,17539239,17539249,17539291}; end, 
	 [5] = function (x) mobList = {17539086,17539096,17539150,17539152,17539204,17539207,17539218,17539219,17539230,17539281,17539288,17539295}; end, 
	 [6] = function (x) mobList = {17539087,17539097,17539151,17539156,17539208,17539220,17539221,17539231,17539282,17539289}; end, 
	 [7] = function (x) mobList = {17539095,17539117,17539132,17539155,17539160,17539170}; end, 
	 [8] = function (x) mobList = {17539075,17539091,17539108,17539115,17539130,17539135}; end, 
	 [9] = function (x) mobList = {17539094,17539109,17539122,17539128,17539203,17539205}; end, 
	[10] = function (x) mobList = {17539079,17539100,17539124,17539180,17539181,17539186}; end, 
	[11] = function (x) mobList = {17539080,17539107,17539131,17539134,17539145,17539146}; end, 
	[12] = function (x) mobList = {17539078,17539085,17539102,17539123,17539137,17539139,17539141,17539168,17539179,17539185,17539194,17539246,17539251,17539270,17539271,17539280,17539298}; end, 
	[13] = function (x) mobList = {17539098,17539166,17539209,17539211,17539222,17539272}; end, 
	[14] = function (x) mobList = {17539081,17539092,17539093,17539116,17539126,17539136}; end, 
	[15] = function (x) mobList = {17539074,17539083,17539090,17539114,17539129,17539133}; end, 
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
	
	mobID = mob:getID();
	X = mob:getXPos();
	Y = mob:getYPos();
	Z = mob:getZPos();
	
	for nb = 1, table.getn(spawnList), 2 do
		if(mobID == spawnList[nb]) then
			for nbi = 1, table.getn(spawnList[nb + 1]), 1 do
				if((nbi % 2) == 0) then X=X+2; Z=Z+2; else X=X-2; Z=Z-2; end
				
				if(spawnList[nb + 1][nbi] <= 20) then
					mobList = getListDynaMob(spawnList[nb + 1][nbi]);
					for nbo = 1, table.getn(mobList), 1 do
						if(GetMobAction(mobList[nbo]) == 0) then
							-- Spawn Mob
							SpawnMob(mobList[nbo]):updateEnmity(target);
							GetMobByID(mobList[nbo]):setPos(X,Y,Z);
							-- Spawn Pet for BST, DRG, and SMN
							if(spawnList[nb + 1][nbi] == 1 or spawnList[nb + 1][nbi] == 4 or spawnList[nb + 1][nbi] == 13) then
								SpawnMob(mobList[nbo] + 1):updateEnmity(target);
								GetMobByID(mobList[nbo] + 1):setPos(X,Y,Z);
							end
							break;
						end
					end
				elseif(spawnList[nb + 1][nbi] > 20) then
					-- Special spawn
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
	-- Time Bonus: 001 019 041
	if(mobID == 17539350 or mobID == 17539368 or mobID == 17539386) then
		killer:addTimeToDynamis(20);
	-- HP Bonus: 007 008 025 042 082 085 092
	elseif(mobID == 17539356 or mobID == 17539357 or mobID == 17539374 or mobID == 17539387 or 
		   mobID == 17539426 or mobID == 17539429 or mobID == 17539171) then 
		killer:addHP(2000);
		killer:messageBasic(024,(killer:getMaxHP()-killer:getHP()));
	-- MP Bonus: 026 031 038 081 104
	elseif(mobID == 17539118 or mobID == 17539161 or mobID == 17539383 or 
		   mobID == 17539425 or mobID == 17539446) then 
		killer:addMP(2000);
		killer:messageBasic(025,(killer:getMaxMP()-killer:getMP()));
	end
	
end;
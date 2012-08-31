-----------------------------------
-- Area: Dynamis Bastok
-- NPC:  Adamantking Effigy
-- Map Position: http://www.dynamislounge.com/html/zone/frame_bas1.htm
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
-- 16: Adamantking Effigy

-- [Position on the map] Adamantking mobid, {spawnlist: mob1, mob2,...}
spawnList = {--[[001]] 17539118,{6,12},		--[[002]] 17539119,{5,9},		--[[003]] 17539120,{10,15},		--[[004]] 17539161,{11,15},		--[[005]] 17539162,{4,9},
			 --[[006]] 17539163,{1,1},		--[[007]] 17539171,{1,1},		--[[008]] 17539229,{1,1},		--[[009]] 17539172,{5,9},		--[[010]] 17539173,{5,9},
			 --[[011]] 17539227,{6,12,15},	--[[012]] 17539228,{4,5,9},		--[[013]] 17539234,{2,6},		--[[014]] 17539235,{12,14},		--[[016]] 17539387,{10},
			 --[[018]] 17539389,{11},		--[[020]] 17539236,{14,6,12},	--[[021]] 17539335,{4,10},		--[[022]] 17539333,{12,5},		--[[023]] 17539334,{14,9},
			 --[[024]] 17539330,{7,8},		--[[025]] 17539331,{2,15},		--[[027]] 17539332,{10,11},		--[[028]] 17539266,{6,3,5,15,12,9,16,16},
			 --[[032]] 17539267,{6,14,2},	--[[033]] 17539274,{11,15},		--[[034]] 17539275,{2,5},		--[[035]] 17539336,{3,8,9},		--[[036]] 17539337,{3,8,10},
			 --[[037]] 17539338,{3,6,10},	--[[039]] 17539287,{1,1,1},		--[[040]] 17539293,{13},		--[[042]] 17539408,{1,1,1},		--[[043]] 17539339,{5,12},
			 --[[044]] 17539340,{11,15,14},	--[[045]] 17539341,{15,8,10},	--[[046]] 17539342,{15,5,10},	--[[047]] 17539343,{14,8,10},	--[[048]] 17539344,{3,11,10},
			 --[[049]] 17539345,{6},		--[[050]] 17539346,{15,9},		--[[051]] 17539347,{4,6,10},	--[[052]] 17539348,{14,5,9},	--[[053]] 17539349,{2,16},
			 --[[055]] 17539350,{2},		--[[056]] 17539351,{13},		--[[057]] 17539352,{13},		--[[058]] 17539353,{15,8,2},	--[[059]] 17539354,{15,11},
			 --[[060]] 17539355,{14,8,2},	--[[061]] 17539356,{3,8,2},		--[[062]] 17539357,{2},			--[[063]] 17539358,{14,8,2},	--[[064]] 17539359,{3,14,1},
			 --[[065]] 17539360,{14,8,9},	--[[066]] 17539361,{15,11,10},	--[[068]] 17539363,{3,5,12},	--[[069]] 17539364,{2},			--[[070]] 17539365,{7,7},
			 --[[071]] 17539366,{7},		--[[072]] 17539367,{4,11},		--[[073]] 17539368,{14,5},		--[[075]] 17539370,{3,6},		--[[076]] 17539371,{15,9},
			 --[[077]] 17539372,{4,12},		--[[078]] 17539373,{3,8,12},	--[[079]] 17539374,{14,8,12},	--[[082]] 17539377,{6},			--[[083]] 17539378,{3,6},
			 --[[086]] 17539381,{15,6},		--[[087]] 17539382,{14,5,9},	--[[088]] 17539383,{8,8,14,12,7,7},							--[[090]] 17539391,{3,2},
			 --[[091]] 17539384,{2},		--[[093]] 17539385,{4,11,2},	--[[095]] 17539393,{3,11},		--[[096]] 17539394,{6,10},		--[[097]] 17539395,{11,12},
			 --[[098]] 17539396,{6,9},		--[[099]] 17539397,{14,9},		--[[100]] 17539398,{3,10},		--[[101]] 17539399,{4,5},		--[[102]] 17539400,{11},
			 --[[105]] 17539403,{5,10},		--[[106]] 17539404,{6,12},		--[[107]] 17539405,{4,8},		--[[108]] 17539406,{4,10},		--[[109]] 17539407,{3,12}
			 };
----[[011]] 00000000,{},--[[012]] 00000000,{},--[[013]] 00000000,{},--[[014]] 00000000,{},--[[015]] 00000000,{},
-- Need to add :
-- 39/42 random nm spawn with 3 BST
-- 88 add 3 mobs (WHM WAR MNK) with extender 10min

function getListDynaMob(thismob)

	switch (thismob) : caseof {
	 [1] = function (x) mobList = {17539076,17539110,17539177,17539197,17539213,17539237,17539247,17539284}; end, 
	 [2] = function (x) mobList = {17539084,17539101,17539125,17539182,17539187,17539193,17539243,17539245,17539268,17539269,17539304}; end, 
	 [3] = function (x) mobList = {17539082,17539103,17539104,17539103,17539127,17539176,17539184,17539189,17539196,17539226,17539233,17539256,17539278}; end, 
	 [4] = function (x) mobList = {17539088,17539105,17539112,17539164,17539199,17539239,17539249,17539291}; end, 
	 [5] = function (x) mobList = {17539086,17539096,17539150,17539152,17539204,17539207,17539218,17539219,17539230,17539281,17539288,17539295}; end, 
	 [6] = function (x) mobList = {17539087,17539097,17539151,17539156,17539208,17539220,17539221,17539231,17539282,17539289}; end, 
	 [7] = function (x) mobList = {17539095,17539117,17539132}; end, 
	 [8] = function (x) mobList = {17539075,17539091,17539108}; end, 
	 [9] = function (x) mobList = {17539094,17539109,17539122}; end, 
	[10] = function (x) mobList = {17539079,17539100,17539124}; end, 
	[11] = function (x) mobList = {17539080,17539107,17539131}; end, 
	[12] = function (x) mobList = {17539078,17539085,17539102,17539123,17539137,17539139,17539141,17539168,17539179,17539185,17539194,17539246,17539251,17539270,17539271,17539280,17539298}; end, 
	[13] = function (x) mobList = {17539098,17539166,17539209}; end, 
	[14] = function (x) mobList = {17539081,17539092,17539093}; end, 
	[15] = function (x) mobList = {17539074,17539083,17539090}; end, 
	[16] = function (x) mobList = {17539410,17539411,17539415,17539416}; end, 
	}
	
	return mobList;

end;

-----------------------------------
-- alreadyCheckedNPC
-----------------------------------

function alreadyKilled(number)
	
	local dynaVar = GetServerVariable("[DynaBastok]Already_Killed");
	local bit = {};
	
	for i = 10,0,-1 do 
		twop = 2^i;
		if(dynaVar >= twop) then
			bit[i+1] = 1;
			dynaVar = dynaVar - twop;
		else
			bit[i+1] = 0;
		end;
	end;
	printf("killed %u",bit[number]);
	if(bit[number] == 0) then
		return false;
	else
		return true;
	end
	
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
				mobList = getListDynaMob(spawnList[nb + 1][nbi]);
				for nbo = 1, table.getn(mobList), 1 do
					if(GetMobAction(mobList[nbo]) == 0) then
						if((nb % 2) == 0) then X=X+2; Z=Z+2; else X=X-2; Z=Z-2; end
						-- Spawn Mob
						SpawnMob(mobList[nbo]):updateEnmity(target);
						GetMobByID(mobList[nbo]):setPos(X,Y,Z);
						-- Spawn Pet for BST, DRG, and SMN
						if(spawnList[nb + 1][nbi] == 1 or spawnList[nb + 1][nbi] == 4 or spawnList[nb + 1][nbi] == 13) then
							SpawnMob(mobList[nbo] + 1):updateEnmity(target);
							GetMobByID(mobList[nbo] + 1):setPos(X,Y,Z);
						end
						-- Spawn Special statue/mob with Time/HP/MP Bonus
						if(mobID == 17539331 and GetMobAction(17539409) == 0) then -- 025 spawn 026 (MP Bonus)
							SpawnMob(17539409):updateEnmity(target);
							GetMobByID(17539409):setPos(X,Y,Z);
						elseif(mobID == 17539266 and GetMobAction(17539412) == 0) then -- 028 spawn 031 (MP Bonus)
							SpawnMob(17539412):updateEnmity(target);
							GetMobByID(17539412):setPos(X,Y,Z);
						elseif(mobID == 17539383 and GetMobAction(17539413) == 0) then -- 088 spawn 089 (HP Bonus)
							SpawnMob(17539413):updateEnmity(target);
							GetMobByID(17539413):setPos(X,Y,Z);
						elseif(mobID == 17539384 and GetMobAction(17539414) == 0) then -- 091 spawn 092 (HP Bonus)
							SpawnMob(17539414):updateEnmity(target);
							GetMobByID(17539414):setPos(X,Y,Z);
						end
						-- Spawn NM
						if(mobID == 17539349 and GetMobAction(17539188) == 0 and alreadyKilled(4) == false) then -- Spawn Gi'Pha Manameister (with 053)
							SpawnMob(17539188):updateEnmity(target);
							GetMobByID(17539188):setPos(X,Y,Z);
						elseif(mobID == 17539350 and GetMobAction(17539143) == 0 and alreadyKilled(5) == false) then -- Spawn Gu'Nhi Noondozer (with 55)
							SpawnMob(17539143):updateEnmity(target);
							GetMobByID(17539143):setPos(X,Y,Z);
						elseif(mobID == 17539364 and GetMobAction(17539190) == 0 and alreadyKilled(6) == false) then -- Spawn Ko'Dho Cannonball (with 69)
							SpawnMob(17539190):updateEnmity(target);
							GetMobByID(17539190):setPos(X,Y,Z);
						elseif(mobID == 17539391 and GetMobAction(17539147) == 0 and alreadyKilled(7) == false) then -- Spawn Ze'Vho Fallsplitter (with 91)
							SpawnMob(17539147):updateEnmity(target);
							GetMobByID(17539147):setPos(X,Y,Z);
						end
						break;
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
	if(mobID == 17539118 and alreadyKilled(1) == false) then -- 001
		killer:addTimeToDynamis(20); -- Add + 20min
		SetServerVariable("[DynaBastok]Already_Killed",GetServerVariable("[DynaBastok]Already_Killed") + 1);
	elseif(mobID == 17539390 and alreadyKilled(2) == false) then -- 019
		killer:addTimeToDynamis(20); -- Add + 20min
		SetServerVariable("[DynaBastok]Already_Killed",GetServerVariable("[DynaBastok]Already_Killed") + 2);
	elseif(mobID == 17539294 and alreadyKilled(3) == false) then -- 041
		killer:addTimeToDynamis(20); -- Add + 20min
		SetServerVariable("[DynaBastok]Already_Killed",GetServerVariable("[DynaBastok]Already_Killed") + 4);
	-- 007 008 025 042 082 085 092
	elseif(mobID == 17539171 or mobID == 17539229 or mobID == 17539331 or mobID == 17539408 or 
		   mobID == 17539377 or mobID == 17539380 or mobID == 17539411) then 
		killer:addHP(2000);
		killer:messageBasic(024,(killer:getMaxHP()-killer:getHP()));
	-- 026 031 038 081 104
	elseif(mobID == 17539409 or mobID == 17539410 or mobID == 17539286 or 
		   mobID == 17539376 or mobID == 17539402) then 
		killer:addMP(2000);
		killer:messageBasic(025,(killer:getMaxMP()-killer:getMP()));
	end
	
end;
-----------------------------------
-- Spawn System for Sturdy Pyxis
-----------------------------------
package.loaded["scripts/zones/Abyssea-Konschtat/TextIDs"] = nil;
package.loaded["scripts/zones/Abyssea-La_Theine/TextIDs"] = nil;
package.loaded["scripts/zones/Abyssea-Tahrongi/TextIDs"] = nil;
package.loaded["scripts/zones/Abyssea-Altepa/TextIDs"] = nil;
package.loaded["scripts/zones/Abyssea-Attohwa/TextIDs"] = nil;
package.loaded["scripts/zones/Abyssea-Grauberg/TextIDs"] = nil;
package.loaded["scripts/zones/Abyssea-Misareaux/TextIDs"] = nil;
package.loaded["scripts/zones/Abyssea-Uleguerand/TextIDs"] = nil;
package.loaded["scripts/zones/Abyssea-Vunkerl/TextIDs"] = nil;
require("scripts/zones/Abyssea-Konschtat/TextIDs");
require("scripts/zones/Abyssea-La_Theine/TextIDs");
require("scripts/zones/Abyssea-Tahrongi/TextIDs");
require("scripts/zones/Abyssea-Altepa/TextIDs");
require("scripts/zones/Abyssea-Attohwa/TextIDs");
require("scripts/zones/Abyssea-Grauberg/TextIDs");
require("scripts/zones/Abyssea-Misareaux/TextIDs");
require("scripts/zones/Abyssea-Uleguerand/TextIDs");
require("scripts/zones/Abyssea-Vunkerl/TextIDs");
require("scripts/globals/common");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/status");
require("scripts/globals/utils");
-----------------------------------
function PyxisSpawn(mob,killer,npc)
	-- -------------------------------------------------------------------------------------
	-- Pearlescent: All sturdy pyxides will appear with greater frequency. 
	-- Ebon: Enemies will bestow experience points and cruor at an increased rate.
	-- Golden: Enemies will bestow experience points at an increased rate. 
	-- Silvery: Enemies will bestow cruor at an increased rate.
	-- Azure: Blue pyxides will appear with greater frequency and yield superior spoils.
	-- Ruby: Red pyxides will appear with greater frequency and yield superior spoils. 
	-- Amber: Gold pyxides will appear with greater frequency and yield superior spoils.
	-- -------------------------------------------------------------------------------------
    local zone = killer:getZone();   
	local LightPearl = killer:getVar("LightPearl");
	local LightEbon = killer:getVar("LightEbon");
	local LightGold = killer:getVar("LightGold");
	local LightSilver = killer:getVar("LightSilver");
	local LightAzure = killer:getVar("LightAzure");
	local LightRuby = killer:getVar("LightRuby");
	local LightAmber = killer:getVar("LightAmber");
	
    if (LightPearl < 50) then
	
		if (LightPearl < 20) and (LightRuby < 1) then
		
			local spawnchance = 1; -- math.random(0,20);
			
			if (spawnchance == 1) then
			
				local chest = 1 -- math.random(1,18);
				
				if (chest == 1) then NPC = 16839113;-- Small gold Tier[1]
				elseif (chest == 2) then NPC = 16839114;-- Small gold Tier[1]
				elseif (chest == 3) then NPC = 16839115;-- Small gold Tier[1]
				elseif (chest == 4) then NPC = 16839122;-- Red Faint 
				elseif (chest == 5) then NPC = 16839126;-- Red Faint Tier[1]
				elseif (chest == 6) then NPC = 16839127;-- Red Faint Tier[1]
				elseif (chest == 7) then NPC = 16839132;-- Red Faint Tier[1]
				elseif (chest == 8) then NPC = 16839140;-- Blue Temp Item
				elseif (chest == 9) then NPC = 16839141;-- Blue Temp Item
				elseif (chest == 10) then NPC = 16839142;-- Blue Temp Item
				elseif (chest == 11) then NPC = 16839143;-- Blue Cruor
				elseif (chest == 12) then NPC = 16839144;-- Blue Cruor
				elseif (chest == 13) then NPC = 16839145;-- Blue Cruor
				elseif (chest == 14) then NPC = 16839177;-- Blue Restore/Buff
				elseif (chest == 15) then NPC = 16839178;-- Blue Restore/Buff
				elseif (chest == 16) then NPC = 16839179;-- Blue Exp
				elseif (chest == 17) then NPC = 16839180;-- Blue Exp
				elseif (chest == 18) then NPC = 16839181;-- Blue Exp
				end	
					if (GetNPCByID(NPC):getStatus() == STATUS_DISAPPEAR) then
						GetNPCByID(NPC):teleport(mob:getPos());
						GetNPCByID(NPC):showNPC(300);
						GetNPCByID(NPC):AnimationSub(2);
						GetNPCByID(NPC):setStatus(STATUS_NORMAL);
						print("NPC",NPC); -- Debug, shows what Pyxis spawned by ID, uncomment to use.
						killer:messageSpecial(7445);
					end
			end
			
		elseif (LightPearl < 20) and (LightRuby > 50) then
		
			local spawnchance = math.random(0,20);
			
			if (spawnchance == 1) then
			
				local chest = math.random(1,15);
				
				if (chest == 1) then NPC = 16839113; -- Small gold Tier[1]
				elseif (chest == 2) then NPC = 16839122; -- Red Faint Gold Light 5% Tier[1]
				elseif (chest == 3) then NPC = 16839126; -- Red Faint Silver Light 5% Tier[1]
				elseif (chest == 4) then NPC = 16839127; -- Red Faint Silver Light 5% Tier[1]
				elseif (chest == 5) then NPC = 16839132; -- Red Faint Ebon Light 5% Tier[1]
				elseif (chest == 6) then NPC = 16839140; -- Blue Temp Item
				elseif (chest == 7) then NPC = 16839143; -- Blue Cruor
				elseif (chest == 8) then NPC = 16839177; -- Blue Restore/Buff
				elseif (chest == 9) then NPC = 16839179; -- Blue Exp
				elseif (chest == 10) then NPC = 16839180; -- Blue Exp
				elseif (chest == 11) then NPC = 16839123; -- Red Mild Gold Light 10% Tier[2]
				elseif (chest == 12) then NPC = 16839124; -- Red Mild Gold Light 10% Tier[2]
				elseif (chest == 13) then NPC = 16839128; -- Red Mild Silver Light 10% Tier[2]
				elseif (chest == 14) then NPC = 16839129; -- Red Mild Silver Light 10% Tier[2]
				elseif (chest == 15) then NPC = 16839133; -- Red Mild Ebon Light 10% Tier[2]
				end		
					if (GetNPCByID(NPC):getStatus() == STATUS_DISAPPEAR) then
						GetNPCByID(NPC):teleport(mob:getPos());
						GetNPCByID(NPC):showNPC(300);
						GetNPCByID(NPC):AnimationSub(2);
						GetNPCByID(NPC):setStatus(STATUS_NORMAL);
						print("NPC",NPC); -- Debug, shows what Pyxis spawned by ID, uncomment to use.
						killer:messageSpecial(7445);
					end
			end	
		
		elseif (LightPearl < 20) and (LightRuby > 50) and (LightRuby < 150) then
		
			local spawnchance = math.random(0,20);
			
			if (spawnchance == 1) then
			
				local chest = math.random(1,14);
			 
				if (chest == 1)  then NPC = 16839113; -- Small gold Tier[1]
				elseif (chest == 2) then NPC = 16839125; -- Red Strong Gold Light 15% Tier[3]
				elseif (chest == 3) then NPC = 16839130; -- Red Strong Silver Light 15% Tier[3]
				elseif (chest == 4) then NPC = 16839137; -- Red Strong Ebon Light 15% Tier[3]
				elseif (chest == 5) then NPC = 16839140; -- Blue Temp Item
				elseif (chest == 6) then NPC = 16839143; -- Blue Cruor
				elseif (chest == 7) then NPC = 16839177; -- Blue Restore/Buff
				elseif (chest == 8) then NPC = 16839179; -- Blue Exp
				elseif (chest == 9) then NPC = 16839180; -- Blue Exp
				elseif (chest == 10) then NPC = 16839123; -- Red Mild Gold Light 10% Tier[2]
				elseif (chest == 11) then NPC = 16839124; -- Red Mild Gold Light 10% Tier[2]
				elseif (chest == 12) then NPC = 16839128; -- Red Mild Silver Light 10% Tier[2]
				elseif (chest == 13) then NPC = 16839129; -- Red Mild Silver Light 10% Tier[2]
				elseif (chest == 14) then NPC = 16839133; -- Red Mild Ebon Light 10% Tier[2]
				end		
					if (GetNPCByID(NPC):getStatus() == STATUS_DISAPPEAR) then
						GetNPCByID(NPC):teleport(mob:getPos());
						GetNPCByID(NPC):showNPC(300);
						GetNPCByID(NPC):AnimationSub(2);
						GetNPCByID(NPC):setStatus(STATUS_NORMAL);
						print("NPC",NPC); -- Debug, shows what Pyxis spawned by ID, uncomment to use.
						killer:messageSpecial(7445);
					end
			end		
		
		elseif (LightPearl < 20) and (LightAzure < 50) then
		
			local spawnchance = math.random(0,20);
		
			if (spawnchance == 2) then
			
				local chest = math.random(1,18);
				
				if (chest == 1) then NPC = 16839114; -- Small gold Tier[1]
				elseif (chest == 2) then NPC = 16839115; -- Small gold Tier[1]
				elseif (chest == 3) then NPC = 16839138; -- Blue Time
				elseif (chest == 4) then NPC = 16839139; -- Blue Time
				elseif (chest == 5) then NPC = 16839140; -- Blue Temp Item
				elseif (chest == 6) then NPC = 16839141; -- Blue Temp Item
				elseif (chest == 7) then NPC = 16839142; -- Blue Temp Item
				elseif (chest == 8) then NPC = 16839143; -- Blue Cruor
				elseif (chest == 9) then NPC = 16839144; -- Blue Cruor
				elseif (chest == 10) then NPC = 16839145; -- Blue Cruor
				elseif (chest == 11) then NPC = 16839177; -- Blue Restore/Buff
				elseif (chest == 12) then NPC = 16839178; -- Blue Restore/Buff
				elseif (chest == 13) then NPC = 16839179; -- Blue Exp
				elseif (chest == 14) then NPC = 16839180; -- Blue Exp
				elseif (chest == 15) then NPC = 16839181; -- Blue Exp
				elseif (chest == 16) then NPC = 16839122; -- Red Faint Gold Light 5% Tier[1]
				elseif (chest == 17) then NPC = 16839127; -- Red Faint Silver Light 5% Tier[1]
				elseif (chest == 18) then NPC = 16839132; -- Red Faint Ebon Light 5% Tier[1]
				end		
					if (GetNPCByID(NPC):getStatus() == STATUS_DISAPPEAR) then
						GetNPCByID(NPC):teleport(mob:getPos());
						GetNPCByID(NPC):showNPC(300);
						GetNPCByID(NPC):AnimationSub(2);
						GetNPCByID(NPC):setStatus(STATUS_NORMAL);
						print("NPC",NPC); -- Debug, shows what Pyxis spawned by ID, uncomment to use.
						killer:messageSpecial(7445);
					end
			end
		end
	end
	
	if (LightPearl > 50) and (LightPearl < 150) then
	
		if (LightRuby < 10) then
		
			local spawnchance = math.random(0,15);
		
			if (spawnchance == 1) then
		
				local chest = math.random(1,20);
				
				if (chest == 1)  then NPC = 16839113; -- Small gold Tier[1]
				elseif (chest == 2) then NPC = 16839114; -- Small gold Tier[1]
				elseif (chest == 3) then NPC = 16839115; -- Small gold Tier[1]
				elseif (chest == 4) then NPC = 16839122; -- Red Faint Gold Light 5% Tier[1]
				elseif (chest == 5) then NPC = 16839126; -- Red Faint Silver Light 5% Tier[1]
				elseif (chest == 6) then NPC = 16839127; -- Red Faint Silver Light 5% Tier[1]
				elseif (chest == 7) then NPC = 16839132; -- Red Faint Ebon Light 5% Tier[1]
				elseif (chest == 8) then NPC = 16839138; -- Blue Time
				elseif (chest == 9) then NPC = 16839139; -- Blue Time
				elseif (chest == 10) then NPC = 16839140; -- Blue Temp Item
				elseif (chest == 11) then NPC = 16839141; -- Blue Temp Item
				elseif (chest == 12) then NPC = 16839142; -- Blue Temp Item
				elseif (chest == 13) then NPC = 16839143; -- Blue Cruor
				elseif (chest == 14) then NPC = 16839144; -- Blue Cruor
				elseif (chest == 15) then NPC = 16839145; -- Blue Cruor
				elseif (chest == 16) then NPC = 16839177; -- Blue Restore/Buff
				elseif (chest == 17) then NPC = 16839178; -- Blue Restore/Buff
				elseif (chest == 18) then NPC = 16839179; -- Blue Exp
				elseif (chest == 19) then NPC = 16839180; -- Blue Exp
				elseif (chest == 20) then NPC = 16839181; -- Blue Exp
				end		
					if (GetNPCByID(NPC):getStatus() == STATUS_DISAPPEAR) then
						GetNPCByID(NPC):teleport(mob:getPos());
						GetNPCByID(NPC):showNPC(300);
						GetNPCByID(NPC):AnimationSub(2);
						GetNPCByID(NPC):setStatus(STATUS_NORMAL);
						print("NPC",NPC); -- Debug, shows what Pyxis spawned by ID, uncomment to use.
						killer:messageSpecial(7445);
					end
			end	
		
		elseif (LightRuby > 50 and LightRuby < 150) then
		
			local spawnchance = math.random(0,15);
		
			if (spawnchance == 1) then
			
				local chest = math.random(1,15);
				
				if (chest == 1)  then NPC = 16839113; -- Small gold Tier[1]
				elseif (chest == 2) then NPC = 16839122; -- Red Faint Gold Light 5% Tier[1]
				elseif (chest == 3) then NPC = 16839126; -- Red Faint Silver Light 5% Tier[1]
				elseif (chest == 4) then NPC = 16839127; -- Red Faint Silver Light 5% Tier[1]
				elseif (chest == 5) then NPC = 16839132; -- Red Faint Ebon Light 5% Tier[1]
				elseif (chest == 6) then NPC = 16839140; -- Blue Temp Item
				elseif (chest == 7) then NPC = 16839143; -- Blue Cruor
				elseif (chest == 8) then NPC = 16839177; -- Blue Restore/Buff
				elseif (chest == 9) then NPC = 16839179; -- Blue Exp
				elseif (chest == 10) then NPC = 16839180; -- Blue Exp
				elseif (chest == 11) then NPC = 16839123; -- Red Mild Gold Light 10% Tier[2]
				elseif (chest == 12) then NPC = 16839124; -- Red Mild Gold Light 10% Tier[2]
				elseif (chest == 13) then NPC = 16839128; -- Red Mild Silver Light 10% Tier[2]
				elseif (chest == 14) then NPC = 16839129; -- Red Mild Silver Light 10% Tier[2]
				elseif (chest == 15) then NPC = 16839133; -- Red Mild Ebon Light 10% Tier[2]
				end		
					if (GetNPCByID(NPC):getStatus() == STATUS_DISAPPEAR) then
						GetNPCByID(NPC):teleport(mob:getPos());
						GetNPCByID(NPC):showNPC(300);
						GetNPCByID(NPC):AnimationSub(2);
						GetNPCByID(NPC):setStatus(STATUS_NORMAL);
						print("NPC",NPC); -- Debug, shows what Pyxis spawned by ID, uncomment to use.
						killer:messageSpecial(7445);
					end
			end	
		
		elseif (LightRuby > 200) then
		
			local spawnchance = math.random(0,15);
		
			if (spawnchance == 1) then
			
				local chest = math.random(1,14);
			 
				if (chest == 1)  then NPC = 16839113; -- Small gold Tier[1]
				elseif (chest == 2) then NPC = 16839125; -- Red Strong Gold Light 15% Tier[3]
				elseif (chest == 3) then NPC = 16839130; -- Red Strong Silver Light 15% Tier[3]
				elseif (chest == 4) then NPC = 16839137; -- Red Strong Ebon Light 15% Tier[3]
				elseif (chest == 5) then NPC = 16839140; -- Blue Temp Item
				elseif (chest == 6) then NPC = 16839143; -- Blue Cruor
				elseif (chest == 7) then NPC = 16839177; -- Blue Restore/Buff
				elseif (chest == 8) then NPC = 16839179; -- Blue Exp
				elseif (chest == 9) then NPC = 16839180; -- Blue Exp
				elseif (chest == 10) then NPC = 16839123; -- Red Mild Gold Light 10% Tier[2]
				elseif (chest == 11) then NPC = 16839124; -- Red Mild Gold Light 10% Tier[2]
				elseif (chest == 12) then NPC = 16839128; -- Red Mild Silver Light 10% Tier[2]
				elseif (chest == 13) then NPC = 16839129; -- Red Mild Silver Light 10% Tier[2]
				elseif (chest == 14) then NPC = 16839133; -- Red Mild Ebon Light 10% Tier[2]
				end		
					if (GetNPCByID(NPC):getStatus() == STATUS_DISAPPEAR) then
						GetNPCByID(NPC):teleport(mob:getPos());
						GetNPCByID(NPC):showNPC(300);
						GetNPCByID(NPC):AnimationSub(2);
						GetNPCByID(NPC):setStatus(STATUS_NORMAL);
						print("NPC",NPC); -- Debug, shows what Pyxis spawned by ID, uncomment to use.
						killer:messageSpecial(7445);
					end
			end	
		
		elseif (LightGold > 50 and LightGold < 150) then
		
			local spawnchance = math.random(0,15);
		
			if (spawnchance == 2) then
			
				local chest = math.random(1,10);
				
				if (chest == 1)  then NPC = 16839113; -- Small gold Tier[1]
				elseif (chest == 2) then NPC = 16839114; -- Small gold Tier[1]
				elseif (chest == 3) then NPC = 16839115; -- Small gold Tier[1]
				elseif (chest == 4) then NPC = 16839140; -- Blue Temp Item
				elseif (chest == 5) then NPC = 16839143; -- Blue Cruor
				elseif (chest == 6) then NPC = 16839177; -- Blue Restore/Buff
				elseif (chest == 7) then NPC = 16839179; -- Blue Exp
				elseif (chest == 8) then NPC = 16839180; -- Blue Exp
				elseif (chest == 9) then NPC = 16839116; -- Small gold Tier[2]
				elseif (chest == 10) then NPC = 16839117; -- Small gold Tier[2]
				end		
					if (GetNPCByID(NPC):getStatus() == STATUS_DISAPPEAR) then
						GetNPCByID(NPC):teleport(mob:getPos());
						GetNPCByID(NPC):showNPC(300);
						GetNPCByID(NPC):AnimationSub(2);
						GetNPCByID(NPC):setStatus(STATUS_NORMAL);
						print("NPC",NPC); -- Debug, shows what Pyxis spawned by ID, uncomment to use.
						killer:messageSpecial(7445);
					end
			end
		end
	end
	
	if (LightPearl > 150) and (LightPearl < 200) then
	
	    if (LightRuby < 10) then
		
			local spawnchance = math.random(0,8);
		
			if (spawnchance == 1) then
		
				local chest = math.random(1,20);
				
				if (chest == 1)  then NPC = 16839113; -- Small gold Tier[1]
				elseif (chest == 2) then NPC = 16839114; -- Small gold Tier[1]
				elseif (chest == 3) then NPC = 16839115; -- Small gold Tier[1]
				elseif (chest == 4) then NPC = 16839122; -- Red Faint Gold Light 5% Tier[1]
				elseif (chest == 5) then NPC = 16839126; -- Red Faint Silver Light 5% Tier[1]
				elseif (chest == 6) then NPC = 16839127; -- Red Faint Silver Light 5% Tier[1]
				elseif (chest == 7) then NPC = 16839132; -- Red Faint Ebon Light 5% Tier[1]
				elseif (chest == 8) then NPC = 16839138; -- Blue Time
				elseif (chest == 9) then NPC = 16839139; -- Blue Time
				elseif (chest == 10) then NPC = 16839140; -- Blue Temp Item
				elseif (chest == 11) then NPC = 16839141; -- Blue Temp Item
				elseif (chest == 12) then NPC = 16839142; -- Blue Temp Item
				elseif (chest == 13) then NPC = 16839143; -- Blue Cruor
				elseif (chest == 14) then NPC = 16839144; -- Blue Cruor
				elseif (chest == 15) then NPC = 16839145; -- Blue Cruor
				elseif (chest == 16) then NPC = 16839177; -- Blue Restore/Buff
				elseif (chest == 17) then NPC = 16839178; -- Blue Restore/Buff
				elseif (chest == 18) then NPC = 16839179; -- Blue Exp
				elseif (chest == 19) then NPC = 16839180; -- Blue Exp
				elseif (chest == 20) then NPC = 16839181; -- Blue Exp
				end		
					if (GetNPCByID(NPC):getStatus() == STATUS_DISAPPEAR) then
						GetNPCByID(NPC):teleport(mob:getPos());
						GetNPCByID(NPC):showNPC(300);
						GetNPCByID(NPC):AnimationSub(2);
						GetNPCByID(NPC):setStatus(STATUS_NORMAL);
						print("NPC",NPC); -- Debug, shows what Pyxis spawned by ID, uncomment to use.
						killer:messageSpecial(7445);
					end
			end	
		
		elseif (LightRuby > 50) and (LightRuby < 150) then
		
			local spawnchance = math.random(0,8);
		
			if (spawnchance == 1) then
		
				local chest = math.random(1,15);
			 
				if (chest == 1)  then NPC = 16839113; -- Small gold Tier[1]
				elseif (chest == 2) then NPC = 16839122; -- Red Faint Gold Light 5% Tier[1]
				elseif (chest == 3) then NPC = 16839126; -- Red Faint Silver Light 5% Tier[1]
				elseif (chest == 4) then NPC = 16839127; -- Red Faint Silver Light 5% Tier[1]
				elseif (chest == 5) then NPC = 16839132; -- Red Faint Ebon Light 5% Tier[1]
				elseif (chest == 6) then NPC = 16839140; -- Blue Temp Item
				elseif (chest == 7) then NPC = 16839143; -- Blue Cruor
				elseif (chest == 8) then NPC = 16839177; -- Blue Restore/Buff
				elseif (chest == 9) then NPC = 16839179; -- Blue Exp
				elseif (chest == 10) then NPC = 16839180; -- Blue Exp
				elseif (chest == 11) then NPC = 16839123; -- Red Mild Gold Light 10% Tier[2]
				elseif (chest == 12) then NPC = 16839124; -- Red Mild Gold Light 10% Tier[2]
				elseif (chest == 13) then NPC = 16839128; -- Red Mild Silver Light 10% Tier[2]
				elseif (chest == 14) then NPC = 16839129; -- Red Mild Silver Light 10% Tier[2]
				elseif (chest == 15) then NPC = 16839133; -- Red Mild Ebon Light 10% Tier[2]
				end		
					if (GetNPCByID(NPC):getStatus() == STATUS_DISAPPEAR) then
						GetNPCByID(NPC):teleport(mob:getPos());
						GetNPCByID(NPC):showNPC(300);
						GetNPCByID(NPC):AnimationSub(2);
						GetNPCByID(NPC):setStatus(STATUS_NORMAL);
						print("NPC",NPC); -- Debug, shows what Pyxis spawned by ID, uncomment to use.
						killer:messageSpecial(7445);
					end
			end
		 
		elseif (LightRuby > 200) then
		
			local spawnchance = math.random(0,8);
		
			if (spawnchance == 1) then
		
				local chest = math.random(1,14);
		
				if (chest == 1)  then NPC = 16839113; -- Small gold Tier[1]
				elseif (chest == 2) then NPC = 16839125; -- Red Strong Gold Light 15% Tier[3]
				elseif (chest == 3) then NPC = 16839130; -- Red Strong Silver Light 15% Tier[3]
				elseif (chest == 4) then NPC = 16839137; -- Red Strong Ebon Light 15% Tier[3]
				elseif (chest == 5) then NPC = 16839140; -- Blue Temp Item
				elseif (chest == 6) then NPC = 16839143; -- Blue Cruor
				elseif (chest == 7) then NPC = 16839177; -- Blue Restore/Buff
				elseif (chest == 8) then NPC = 16839179; -- Blue Exp
				elseif (chest == 9) then NPC = 16839180; -- Blue Exp
				elseif (chest == 10) then NPC = 16839123; -- Red Mild Gold Light 10% Tier[2]
				elseif (chest == 11) then NPC = 16839124; -- Red Mild Gold Light 10% Tier[2]
				elseif (chest == 12) then NPC = 16839128; -- Red Mild Silver Light 10% Tier[2]
				elseif (chest == 13) then NPC = 16839129; -- Red Mild Silver Light 10% Tier[2]
				elseif (chest == 14) then NPC = 16839133; -- Red Mild Ebon Light 10% Tier[2]
				end		
					if (GetNPCByID(NPC):getStatus() == STATUS_DISAPPEAR) then
						GetNPCByID(NPC):teleport(mob:getPos());
						GetNPCByID(NPC):showNPC(300);
						GetNPCByID(NPC):AnimationSub(2);
						GetNPCByID(NPC):setStatus(STATUS_NORMAL);
						print("NPC",NPC); -- Debug, shows what Pyxis spawned by ID, uncomment to use.
						killer:messageSpecial(7445);
					end
			end	
		elseif (LightAzure > 150) and (LightAzure < 200) then
		
			local spawnchance = math.random(0,8);
		
			if (spawnchance == 2) then
			
				local chest = math.random(1,18);
				
				if (chest == 1) then NPC = 16839114; -- Small gold Tier[1]
				elseif (chest == 2) then NPC = 16839115; -- Small gold Tier[1]
				elseif (chest == 3) then NPC = 16839138; -- Blue Time
				elseif (chest == 4) then NPC = 16839139; -- Blue Time
				elseif (chest == 5) then NPC = 16839140; -- Blue Temp Item
				elseif (chest == 6) then NPC = 16839141; -- Blue Temp Item
				elseif (chest == 7) then NPC = 16839142; -- Blue Temp Item
				elseif (chest == 8) then NPC = 16839143; -- Blue Cruor
				elseif (chest == 9) then NPC = 16839144; -- Blue Cruor
				elseif (chest == 10) then NPC = 16839145; -- Blue Cruor
				elseif (chest == 11) then NPC = 16839177; -- Blue Restore/Buff
				elseif (chest == 12) then NPC = 16839178; -- Blue Restore/Buff
				elseif (chest == 13) then NPC = 16839179; -- Blue Exp
				elseif (chest == 14) then NPC = 16839180; -- Blue Exp
				elseif (chest == 15) then NPC = 16839181; -- Blue Exp
				elseif (chest == 16) then NPC = 16839122; -- Red Faint Gold Light 5% Tier[1]
				elseif (chest == 17) then NPC = 16839127; -- Red Faint Silver Light 5% Tier[1]
				elseif (chest == 18) then NPC = 16839132; -- Red Faint Ebon Light 5% Tier[1]
				end		
					if (GetNPCByID(NPC):getStatus() == STATUS_DISAPPEAR) then
						GetNPCByID(NPC):teleport(mob:getPos());
						GetNPCByID(NPC):showNPC(300);
						GetNPCByID(NPC):AnimationSub(2);
						GetNPCByID(NPC):setStatus(STATUS_NORMAL);
						print("NPC",NPC); -- Debug, shows what Pyxis spawned by ID, uncomment to use.
						killer:messageSpecial(7445);
					end
			end
			
		elseif (LightGold > 150) and (LightGold < 200) then
		
			local spawnchance = math.random(0,8);
		
			if (spawnchance == 3) then
			
				local chest = math.random(1,11);
				
				if (chest == 1) then NPC = 16839140; -- Blue Temp Item
				elseif (chest == 2) then NPC = 16839143; -- Blue Cruor
				elseif (chest == 3) then NPC = 16839177; -- Blue Restore/Buff
				elseif (chest == 4) then NPC = 16839179; -- Blue Exp
				elseif (chest == 5) then NPC = 16839180; -- Blue Exp
				elseif (chest == 6) then NPC = 16839116; -- Small gold Tier[2]
				elseif (chest == 7) then NPC = 16839117; -- Small gold Tier[2]
				elseif (chest == 8) then NPC = 16839118; -- Small gold Tier[3]
				elseif (chest == 9) then NPC = 16839119; -- Small gold Tier[3]
				elseif (chest == 10) then NPC = 16839182; -- Large gold Tier[4]
				elseif (chest == 11) then NPC = 16839183; -- Large gold Tier[4]
				end
					if (GetNPCByID(NPC):getStatus() == STATUS_DISAPPEAR) then
						GetNPCByID(NPC):teleport(mob:getPos());
						GetNPCByID(NPC):showNPC(300);
						GetNPCByID(NPC):AnimationSub(2);
						GetNPCByID(NPC):setStatus(STATUS_NORMAL);
						print("NPC",NPC); -- Debug, shows what Pyxis spawned by ID, uncomment to use.
						killer:messageSpecial(7445);
					end	
			end
		end	
	end
	
	if (LightPearl > 200) then
	
		if (LightRuby < 10) then
		
			local spawnchance = math.random(0,5);
		
			if (spawnchance == 1) then
		
				local chest = math.random(1,20);
	     
				if (chest == 1)  then NPC = 16839113; -- Small gold Tier[1]
				elseif (chest == 2) then NPC = 16839114; -- Small gold Tier[1]
				elseif (chest == 3) then NPC = 16839115; -- Small gold Tier[1]
				elseif (chest == 4) then NPC = 16839122; -- Red Faint Gold Light 5% Tier[1]
				elseif (chest == 5) then NPC = 16839126; -- Red Faint Silver Light 5% Tier[1]
				elseif (chest == 6) then NPC = 16839127; -- Red Faint Silver Light 5% Tier[1]
				elseif (chest == 7) then NPC = 16839132; -- Red Faint Ebon Light 5% Tier[1]
				elseif (chest == 8) then NPC = 16839138; -- Blue Time
				elseif (chest == 9) then NPC = 16839139; -- Blue Time
				elseif (chest == 10) then NPC = 16839140; -- Blue Temp Item
				elseif (chest == 11) then NPC = 16839141; -- Blue Temp Item
				elseif (chest == 12) then NPC = 16839142; -- Blue Temp Item
				elseif (chest == 13) then NPC = 16839143; -- Blue Cruor
				elseif (chest == 14) then NPC = 16839144; -- Blue Cruor
				elseif (chest == 15) then NPC = 16839145; -- Blue Cruor
				elseif (chest == 16) then NPC = 16839177; -- Blue Restore/Buff
				elseif (chest == 17) then NPC = 16839178; -- Blue Restore/Buff
				elseif (chest == 18) then NPC = 16839179; -- Blue Exp
				elseif (chest == 19) then NPC = 16839180; -- Blue Exp
				elseif (chest == 20) then NPC = 16839181; -- Blue Exp
				end		
					if (GetNPCByID(NPC):getStatus() == STATUS_DISAPPEAR) then
						GetNPCByID(NPC):teleport(mob:getPos());
						GetNPCByID(NPC):showNPC(300);
						GetNPCByID(NPC):AnimationSub(2);
						GetNPCByID(NPC):setStatus(STATUS_NORMAL);
						print("NPC",NPC); -- Debug, shows what Pyxis spawned by ID, uncomment to use.
						killer:messageSpecial(7445);
					end
			end	
		
		elseif (LightRuby > 50) and (LightRuby < 150) then
		
			local spawnchance = math.random(0,5);
		
			if (spawnchance == 1) then
			
				local chest = math.random(1,15);
				
				if (chest == 1)  then NPC = 16839113; -- Small gold Tier[1]
				elseif (chest == 2) then NPC = 16839122; -- Red Faint Gold Light 5% Tier[1]
				elseif (chest == 3) then NPC = 16839126; -- Red Faint Silver Light 5% Tier[1]
				elseif (chest == 4) then NPC = 16839127; -- Red Faint Silver Light 5% Tier[1]
				elseif (chest == 5) then NPC = 16839132; -- Red Faint Ebon Light 5% Tier[1]
				elseif (chest == 6) then NPC = 16839140; -- Blue Temp Item
				elseif (chest == 7) then NPC = 16839143; -- Blue Cruor
				elseif (chest == 8) then NPC = 16839177; -- Blue Restore/Buff
				elseif (chest == 9) then NPC = 16839179; -- Blue Exp
				elseif (chest == 10) then NPC = 16839180; -- Blue Exp
				elseif (chest == 11) then NPC = 16839123; -- Red Mild Gold Light 10% Tier[2]
				elseif (chest == 12) then NPC = 16839124; -- Red Mild Gold Light 10% Tier[2]
				elseif (chest == 13) then NPC = 16839128; -- Red Mild Silver Light 10% Tier[2]
				elseif (chest == 14) then NPC = 16839129; -- Red Mild Silver Light 10% Tier[2]
				elseif (chest == 15) then NPC = 16839133; -- Red Mild Ebon Light 10% Tier[2]
				end		
					if (GetNPCByID(NPC):getStatus() == STATUS_DISAPPEAR) then
						GetNPCByID(NPC):teleport(mob:getPos());
						GetNPCByID(NPC):showNPC(300);
						GetNPCByID(NPC):AnimationSub(2);
						GetNPCByID(NPC):setStatus(STATUS_NORMAL);
						print("NPC",NPC); -- Debug, shows what Pyxis spawned by ID, uncomment to use.
						killer:messageSpecial(7445);
					end
			end
		
		elseif (LightRuby > 200) then
		
			local spawnchance = math.random(0,5);
		
			if (spawnchance == 1) then
			
				local chest = math.random(1,14);
			 
				if (chest == 1)  then NPC = 16839113; -- Small gold Tier[1]
				elseif (chest == 2) then NPC = 16839125; -- Red Strong Gold Light 15% Tier[3]
				elseif (chest == 3) then NPC = 16839130; -- Red Strong Silver Light 15% Tier[3]
				elseif (chest == 4) then NPC = 16839137; -- Red Strong Ebon Light 15% Tier[3]
				elseif (chest == 5) then NPC = 16839140; -- Blue Temp Item
				elseif (chest == 6) then NPC = 16839143; -- Blue Cruor
				elseif (chest == 7) then NPC = 16839177; -- Blue Restore/Buff
				elseif (chest == 8) then NPC = 16839179; -- Blue Exp
				elseif (chest == 9) then NPC = 16839180; -- Blue Exp
				elseif (chest == 10) then NPC = 16839123; -- Red Mild Gold Light 10% Tier[2]
				elseif (chest == 11) then NPC = 16839124; -- Red Mild Gold Light 10% Tier[2]
				elseif (chest == 12) then NPC = 16839128; -- Red Mild Silver Light 10% Tier[2]
				elseif (chest == 13) then NPC = 16839129; -- Red Mild Silver Light 10% Tier[2]
				elseif (chest == 14) then NPC = 16839133; -- Red Mild Ebon Light 10% Tier[2]
				end		
					if (GetNPCByID(NPC):getStatus() == STATUS_DISAPPEAR) then
						GetNPCByID(NPC):teleport(mob:getPos());
						GetNPCByID(NPC):showNPC(300);
						GetNPCByID(NPC):AnimationSub(2);
						GetNPCByID(NPC):setStatus(STATUS_NORMAL);
						print("NPC",NPC); -- Debug, shows what Pyxis spawned by ID, uncomment to use.
						killer:messageSpecial(7445);
					end
			end
		
		elseif (LightAzure > 200) then
		
			local spawnchance = math.random(0,5);
		
			if (spawnchance == 2) then
			
				local chest = math.random(1,18);
				
				if (chest == 1) then NPC = 16839114; -- Small gold Tier[1]
				elseif (chest == 2) then NPC = 16839115; -- Small gold Tier[1]
				elseif (chest == 3) then NPC = 16839138; -- Blue Time
				elseif (chest == 4) then NPC = 16839139; -- Blue Time
				elseif (chest == 5) then NPC = 16839140; -- Blue Temp Item
				elseif (chest == 6) then NPC = 16839141; -- Blue Temp Item
				elseif (chest == 7) then NPC = 16839142; -- Blue Temp Item
				elseif (chest == 8) then NPC = 16839143; -- Blue Cruor
				elseif (chest == 9) then NPC = 16839144; -- Blue Cruor
				elseif (chest == 10) then NPC = 16839145; -- Blue Cruor
				elseif (chest == 11) then NPC = 16839177; -- Blue Restore/Buff
				elseif (chest == 12) then NPC = 16839178; -- Blue Restore/Buff
				elseif (chest == 13) then NPC = 16839179; -- Blue Exp
				elseif (chest == 14) then NPC = 16839180; -- Blue Exp
				elseif (chest == 15) then NPC = 16839181; -- Blue Exp
				elseif (chest == 16) then NPC = 16839122; -- Red Faint Gold Light 5% Tier[1]
				elseif (chest == 17) then NPC = 16839127; -- Red Faint Silver Light 5% Tier[1]
				elseif (chest == 18) then NPC = 16839132; -- Red Faint Ebon Light 5% Tier[1]
				end		
					if (GetNPCByID(NPC):getStatus() == STATUS_DISAPPEAR) then
						GetNPCByID(NPC):teleport(mob:getPos());
						GetNPCByID(NPC):showNPC(300);
						GetNPCByID(NPC):AnimationSub(2);
						GetNPCByID(NPC):setStatus(STATUS_NORMAL);
						print("NPC",NPC); -- Debug, shows what Pyxis spawned by ID, uncomment to use.
						killer:messageSpecial(7445);
					end
			end	
		
		elseif (LightGold > 200) then
		
			local spawnchance = math.random(0,5);
		
			if (spawnchance == 3) then
			
				local chest = math.random(1,16);
				
				if (chest == 1) then NPC = 16839120; -- Small gold Tier[4]
				elseif (chest == 2) then NPC = 16839121; -- Small gold Tier[4]
				elseif (chest == 3) then NPC = 16839182; -- Large gold Tier[4]
				elseif (chest == 4) then NPC = 16839183; -- Large gold Tier[4]
				elseif (chest == 5) then NPC = 16839184; -- Large gold Tier[4]
				elseif (chest == 6) then NPC = 16839185; -- Large gold Tier[4]
				elseif (chest == 7) then NPC = 16839186; -- Large gold Tier[4]
				elseif (chest == 8) then NPC = 16839187; -- Large gold Tier[4]
				elseif (chest == 9) then NPC = 16839188; -- Large gold Tier[4]
				elseif (chest == 10) then NPC = 16839189; -- Large gold Tier[4]
				elseif (chest == 11) then NPC = 16839190; -- Large gold Tier[4]
				elseif (chest == 12) then NPC = 16839192; -- Large gold Tier[4]
				elseif (chest == 13) then NPC = 16839118; -- Small gold Tier[3]
				elseif (chest == 14) then NPC = 16839119; -- Small gold Tier[3]
				end		
					if (GetNPCByID(NPC):getStatus() == STATUS_DISAPPEAR) then
						GetNPCByID(NPC):teleport(mob:getPos());
						GetNPCByID(NPC):showNPC(300);
						GetNPCByID(NPC):AnimationSub(2);
						GetNPCByID(NPC):setStatus(STATUS_NORMAL);
						print("NPC",NPC); -- Debug, shows what Pyxis spawned by ID, uncomment to use.
						killer:messageSpecial(7445);
					end
			end
		end	
	end
end;
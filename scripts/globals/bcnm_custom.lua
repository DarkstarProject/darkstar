Index: scripts/globals/bcnm.lua
===================================================================
--- scripts/globals/bcnm.lua	(revision 9017)
+++ scripts/globals/bcnm.lua	(working copy)
@@ -18,6 +18,8 @@
 					 19,{0,0},-- Spire of Dem
 					 21,{0,0},-- Spire of Mea
 					 23,{0,0},-- Spire of Vahzl
+					 29,{2108,897},-- Rivern site B
+					 30,{1842,928},-- Rivern site A
 					 31,{0,0},-- Monarch Linn
 					 32,{0,0},-- Sealion's Den
 					 35,{0,0},-- The Garden of RuHmet
@@ -48,11 +50,13 @@
 bcnmid_param_map = {6,{640,0},
                     8,{672,0,673,1},
                     10,{704,0,706,2},
-                    13,{736,0},
+                    13,{736,0,738,2},
                     17,{768,0},
 					19,{800,0},
 					21,{832,0},
                     23,{864,0},
+					29,{896,0,897,1},
+					30,{928,0},
 					31,{960,0,961,1},
 					32,{992,0,993,1},
 					35,{1024,0},
@@ -117,7 +121,15 @@
 		return true;
 	end
 end;
-
+function NonTraderHaveRequirement(player,playerbcnmid)
+    if(playerbcnmid == 897 and player:hasKeyItem(WHISPER_OF_THE_WYRMKING)== false)then -- wyrmking_descends non trader player must have this keyitem 
+	   return false;
+	elseif(playerbcnmid == 738 and player:hasKeyItem(SHAFT_2716_OPERATING_LEVER)== false)then -- ENM bionic bug
+	   return false;
+	else
+	return true;
+	end
+end;
 function EventTriggerBCNM(player,npc)
 	player:setVar("trade_bcnmid",0);
 	player:setVar("trade_itemid",0);
@@ -129,7 +141,7 @@
 			status = player:getStatusEffect(EFFECT_BATTLEFIELD);
 			playerbcnmid = status:getPower();
 			playermask = GetBattleBitmask(playerbcnmid,player:getZoneID(),1);
-			if(playermask~=-1) then
+			if(playermask~=-1 and NonTraderHaveRequirement(player,playerbcnmid)==true) then
 				--This gives players who did not trade to go in the option of entering the fight
 				player:startEvent(0x7d00,0,0,0,playermask,0,0,0,0);
 			else
@@ -249,7 +261,7 @@
 
 		if(id == 68 or id == 418 or id == 450 or id == 482 or id == 545 or id == 578 or id == 609 or id == 293) then
 			player:tradeComplete(); -- Removes the item
-		elseif((item >= 1426 and item <= 1440) or item == 1130 or item == 1131 or item == 1175 or item == 1177 or item == 1180 or item == 1178 or item == 1551 or item == 1552 or item == 1553) then -- Orb and Testimony (one time item)
+		elseif((item >= 1426 and item <= 1440) or item == 1130 or item == 1131 or item == 1175 or item == 1177 or item == 1180 or item == 1178 or item == 1551 or item == 1552 or item == 1553 or item == 2108 or item == 1842) then -- Orb and Testimony (one time item)
 			player:createWornItem(item);
 		end
 		return true;
@@ -364,7 +376,11 @@
 						questTimelineOK = 1;
 					elseif(item == 1174 and player:getVar("CarbuncleDebacleProgress") == 6) then -- Carbuncle Debacle (Ogmios)
 						questTimelineOK = 1;
-					end
+					elseif(item == 1842) then -- ouryu cometh
+					    questTimelineOK = 1;
+					elseif(item == 2108 and player:hasKeyItem(WHISPER_OF_THE_WYRMKING) == true)then -- wyrmking_descends
+                        questTimelineOK = 1;
+				    end
 
 					if(questTimelineOK == 1) then
 						player:setVar("trade_bcnmid",itemid_bcnmid_map[zoneindex+1][bcnmindex+1]);
@@ -414,6 +430,9 @@
 	    if(player:getCurrentMission(COP) == THREE_PATHS  and  player:getVar("COP_Louverance_s_Path") == 5) then --century_of_hardship
 	    	 mask = GetBattleBitmask(736,Zone,1);
 	         player:setVar("trade_bcnmid",736);
+		elseif(player:hasKeyItem(SHAFT_2716_OPERATING_LEVER)==true)then -- ENM  Bionic Bug keyitem 676
+			 mask = GetBattleBitmask(738,Zone,1);
+	         player:setVar("trade_bcnmid",738);
 		end
 	elseif(Zone == 17) then -- Spire of Holla
 	    if(player:getCurrentMission(COP) == THE_MOTHERCRYSTALS and player:hasKeyItem(LIGHT_OF_HOLLA) == false) then -- light of holla
@@ -435,6 +454,11 @@
 	        mask = GetBattleBitmask(864,Zone,1);
 	        player:setVar("trade_bcnmid",864);
 	    end
+	elseif(Zone == 29) then -- Rivern site B	
+       if(player:getQuestStatus(JEUNO,STORMS_OF_FATE) == QUEST_ACCEPTED and player:getVar("StormOfFateStatus") == 2)then
+	   	    mask = GetBattleBitmask(896,Zone,1);
+	        player:setVar("trade_bcnmid",896);
+	   end
 	elseif(Zone == 31) then -- Monarch Linn
 	    if(player:getCurrentMission(COP) == ANCIENT_VOWS and player:getVar("PromathiaStatus") == 2) then  -- Ancient Vows bcnm
 	      	mask = GetBattleBitmask(960,Zone,1);
@@ -670,6 +694,10 @@
 	    if((player:hasCompletedMission(COP,DESIRES_OF_EMPTINESS)) or (player:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus") > 8)) then -- desires of emptiness
 			skip = 1;
 	    end
+	elseif(Zone == 29) then	-- Rivern site B
+	   if(player:hasCompleteQuest(JEUNO,STORMS_OF_FATE))then
+	        skip = 1;
+	   end
 	elseif(Zone == 31) then -- Monarch Linn
 	    if(player:hasCompletedMission(COP,ANCIENT_VOWS)) then -- Ancient Vows
 			skip = 1;
Index: scripts/globals/mobskills/Absolute_Terror.lua
===================================================================
--- scripts/globals/mobskills/Absolute_Terror.lua	(revision 9017)
+++ scripts/globals/mobskills/Absolute_Terror.lua	(working copy)
@@ -10,7 +10,10 @@
 ---------------------------------------------------
 
 function onMobSkillCheck(target,mob,skill)
-    if (mob:hasStatusEffect(EFFECT_MIGHTY_STRIKES)) then
+local mobID = mob:getID();
+    if(mobID == 16896157) then
+	    return 1;
+	elseif (mob:hasStatusEffect(EFFECT_MIGHTY_STRIKES)) then
         return 1;
     elseif (mob:hasStatusEffect(EFFECT_SUPER_BUFF)) then
         return 1;
Index: scripts/globals/mobskills/Gigaflare.lua
===================================================================
--- scripts/globals/mobskills/Gigaflare.lua	(revision 0)
+++ scripts/globals/mobskills/Gigaflare.lua	(working copy)
@@ -0,0 +1,27 @@
+---------------------------------------------------
+-- Gigaflare.
+-- Wide Cone Attack fire damage (~1,200) 
+---------------------------------------------------
+
+require("/scripts/globals/settings");
+require("/scripts/globals/status");
+require("/scripts/globals/monstertpmoves");
+
+---------------------------------------------------
+
+function onMobSkillCheck(target,mob,skill)
+    if(mob:getLocalVar("SetGigaflare")==1)then
+	 return 0;
+	else
+     return 1;
+	end
+end;
+
+function onMobWeaponSkill(target, mob, skill)
+   mob:setLocalVar("SetGigaflare",0);
+	local dmgmod = 6;
+	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_FIRE,dmgmod,TP_NO_EFFECT);
+	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);
+	target:delHP(dmg);
+	return dmg;
+end
Index: scripts/globals/mobskills/Horrible_roar.lua
===================================================================
--- scripts/globals/mobskills/Horrible_roar.lua	(revision 0)
+++ scripts/globals/mobskills/Horrible_roar.lua	(working copy)
@@ -0,0 +1,32 @@
+---------------------------------------------
+--  Horrible_roar
+--
+--  Description: Very large AoE (25'?) dispels 4 effects
+
+---------------------------------------------
+require("/scripts/globals/settings");
+require("/scripts/globals/status");
+require("/scripts/globals/monstertpmoves");
+
+---------------------------------------------
+
+function onMobSkillCheck(target,mob,skill)
+local mobID = mob:getID();
+    if (mobID == 16896156)then 
+	   return 1;
+    end
+	return 0;
+end;
+
+function onMobWeaponSkill(target, mob, skill)
+
+	for i= 1,4,1 do
+	     local effect = target:dispelStatusEffect(); 
+          if(effect == EFFECT_NONE)then
+		  skill:setMsg(MSG_NO_EFFECT); -- no effect
+		  else
+		  skill:setMsg(MSG_DISAPPEAR);
+		  end
+	end;
+    return effect;
+end;
\ No newline at end of file
Index: scripts/globals/mobskills/Impulsion.lua
===================================================================
--- scripts/globals/mobskills/Impulsion.lua	(revision 0)
+++ scripts/globals/mobskills/Impulsion.lua	(working copy)
@@ -0,0 +1,40 @@
+---------------------------------------------
+--  Sand Trap
+--
+--  Description: AoE ~500 damage plus Petrify, Blind and Knockback.
+--  Type: Physical
+--  Utsusemi/Blink absorb: Ignore
+--  Range: 15' radial
+--  Notes:
+---------------------------------------------
+require("/scripts/globals/settings");
+require("/scripts/globals/status");
+require("/scripts/globals/monstertpmoves");
+
+---------------------------------------------
+function onMobSkillCheck(target,mob,skill)
+local mobID = mob:getID();
+    if (mobID == 16896156)then 
+	   return 1;
+    end
+	return 0;
+end;
+
+function onMobWeaponSkill(target, mob, skill)
+    local typeEffect = EFFECT_BLINDNESS;
+    local typeEffect2 = EFFECT_PETRIFICATION;
+    local numhits = 1;
+    local accmod = 1.5;
+    local dmgmod = 2.7;
+	 
+    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, math.random(10,16)));
+	skill:setMsg(MobStatusEffectMove(mob, target, typeEffect2, 1, 0, math.random(12,18)));
+	
+    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
+    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
+
+
+    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 20, 0, 120);
+    target:delHP(dmg);
+    return dmg;
+end;
Index: scripts/globals/mobskills/Megaflare.lua
===================================================================
--- scripts/globals/mobskills/Megaflare.lua	(revision 0)
+++ scripts/globals/mobskills/Megaflare.lua	(working copy)
@@ -0,0 +1,27 @@
+---------------------------------------------------
+-- Megaflare
+-- Wide Cone Attack fire damage (~800).
+---------------------------------------------------
+
+require("/scripts/globals/settings");
+require("/scripts/globals/status");
+require("/scripts/globals/monstertpmoves");
+
+---------------------------------------------------
+
+function onMobSkillCheck(target,mob,skill)
+    if(mob:getLocalVar("SetMegaflare")==1)then
+	 return 0;
+	else
+     return 1;
+	end
+end;
+
+function onMobWeaponSkill(target, mob, skill)
+    mob:setLocalVar("SetMegaflare",0);
+	local dmgmod = 4.5;
+	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_FIRE,dmgmod,TP_NO_EFFECT);
+	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);
+	target:delHP(dmg);
+	return dmg;
+end
Index: scripts/globals/mobskills/Shuffle.lua
===================================================================
--- scripts/globals/mobskills/Shuffle.lua	(revision 9017)
+++ scripts/globals/mobskills/Shuffle.lua	(working copy)
@@ -9,7 +9,11 @@
 
 ---------------------------------------------------
 function onMobSkillCheck(target,mob,skill)
-    return 0;
+local mobID = mob:getID();
+    if (mobID == 16896156)then 
+	   return 1;
+    end
+	return 0;
 end;
 
 function onMobWeaponSkill(target, mob, skill)
Index: scripts/globals/mobskills/Sweeping Flail.lua
===================================================================
--- scripts/globals/mobskills/Sweeping Flail.lua	(revision 0)
+++ scripts/globals/mobskills/Sweeping Flail.lua	(working copy)
@@ -0,0 +1,31 @@
+---------------------------------------------------
+-- Sweeping Flail
+-- Spins around to deal physical damage to enemies behind user. Additional effect: Knockback
+---------------------------------------------------
+
+require("/scripts/globals/settings");
+require("/scripts/globals/status");
+require("/scripts/globals/monstertpmoves");
+
+---------------------------------------------------
+
+function onMobSkillCheck(target,mob,skill)
+ local mobhp = mob:getHPP();
+ local mobID = mob:getID();
+    if(target:isBehind(mob, 48) == false and mobID == 16896157) then
+		return 1;
+    elseif (mob:AnimationSub() == 1) then
+        return 1;
+	end
+	return 0;
+end;
+
+function onMobWeaponSkill(target, mob, skill)
+	local numhits = 1;
+	local accmod = 2;
+	local dmgmod = math.random(3,5);
+	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,2,3,4);
+	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,MOBPARAM_3_SHADOW);
+	target:delHP(dmg);
+	return dmg;
+end;
Index: scripts/globals/mobskills/Tempest_wing.lua
===================================================================
--- scripts/globals/mobskills/Tempest_wing.lua	(revision 0)
+++ scripts/globals/mobskills/Tempest_wing.lua	(working copy)
@@ -0,0 +1,28 @@
+---------------------------------------------
+--  Tempest_wing
+--
+--  Description:  Cone Attack wind(?) damage (~400)
+--  Type: Magical (Wind)
+---------------------------------------------
+
+require("/scripts/globals/settings");
+require("/scripts/globals/status");
+require("/scripts/globals/monstertpmoves");
+
+---------------------------------------------
+
+function onMobSkillCheck(target,mob,skill)
+ local mobID = mob:getID();
+   if (mobID == 16896157)then -- Bahamut V2 can't use this
+	  return 1;
+   end
+   return 0;
+end;
+
+function onMobWeaponSkill(target, mob, skill)
+	local dmgmod = 1.4;
+	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*5,ELE_WIND,dmgmod,TP_NO_EFFECT);
+	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WIND,MOBPARAM_WIPE_SHADOWS);
+	target:delHP(dmg);
+	return dmg;
+end;
Index: scripts/globals/mobskills/Teraflare.lua
===================================================================
--- scripts/globals/mobskills/Teraflare.lua	(revision 0)
+++ scripts/globals/mobskills/Teraflare.lua	(working copy)
@@ -0,0 +1,28 @@
+---------------------------------------------------
+-- terraflare.
+-- Wide Cone Attack fire damage (~1,800) 
+---------------------------------------------------
+
+require("/scripts/globals/settings");
+require("/scripts/globals/status");
+require("/scripts/globals/monstertpmoves");
+
+---------------------------------------------------
+
+function onMobSkillCheck(target,mob,skill)
+    if(mob:getLocalVar("SetTeraflare")==1)then
+	 return 0;
+	else
+     return 1;
+	end
+	
+end;
+
+function onMobWeaponSkill(target, mob, skill)
+    mob:setLocalVar("SetTeraflare",0);
+	local dmgmod = 9;
+	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_FIRE,dmgmod,TP_NO_EFFECT);
+	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);
+	target:delHP(dmg);
+	return dmg;
+end
Index: scripts/globals/mobskills/Touchdown.lua
===================================================================
--- scripts/globals/mobskills/Touchdown.lua	(revision 9017)
+++ scripts/globals/mobskills/Touchdown.lua	(working copy)
@@ -10,7 +10,11 @@
 
 ---------------------------------------------
 function onMobSkillCheck(target,mob,skill)
-	return 1;
+local mobID = mob:getID();
+    if (mobID == 16896157)then -- Bahamut V2 can't use this
+	   return 1;
+    end
+	return 0;
 end;
 
 function onMobWeaponSkill(target, mob, skill)
Index: scripts/globals/mobskills/Trample.lua
===================================================================
--- scripts/globals/mobskills/Trample.lua	(revision 0)
+++ scripts/globals/mobskills/Trample.lua	(working copy)
@@ -0,0 +1,23 @@
+require("/scripts/globals/settings");
+require("/scripts/globals/status");
+require("/scripts/globals/monstertpmoves");
+---------------------------------------------------
+
+function onMobSkillCheck(target,mob,skill)
+  if (mob:getID() == 16896157  )then 
+	  return 1;
+   end
+	return 0;
+end;
+
+function onMobWeaponSkill(target, mob, skill)
+	local numhits = 1;
+	local accmod = 1.5;
+	local dmgmod = 3;
+    local typeEffect = EFFECT_BIND;
+	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
+	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
+	target:delHP(dmg);
+         MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 20);
+	return dmg;
+end;
Index: scripts/zones/Mine_Shaft_2716/bcnms/bionic_bug.lua
===================================================================
--- scripts/zones/Mine_Shaft_2716/bcnms/bionic_bug.lua	(revision 0)
+++ scripts/zones/Mine_Shaft_2716/bcnms/bionic_bug.lua	(working copy)
@@ -0,0 +1,41 @@
+-----------------------------------
+-- Area: Mine_Shaft_2716
+-- Name: bionic_bug
+-- bcnmID : 738 
+-- inst 2 -54 -1 -100
+-- inst 3 425 -121 -99		 
+-----------------------------------
+package.loaded["scripts/zones/Mine_Shaft_2716/TextIDs"] = nil;
+require("scripts/globals/keyitems");
+-----------------------------------
+
+require("scripts/globals/missions");
+require("scripts/zones/Mine_Shaft_2716/TextIDs");
+
+-- After registering the BCNM via bcnmRegister(bcnmid)
+function onBcnmRegister(player,instance)
+end;
+
+-- Physically entering the BCNM via bcnmEnter(bcnmid)
+function onBcnmEnter(player,instance)
+  player:delKeyItem( SHAFT_2716_OPERATING_LEVER );
+end;
+
+-- Leaving the BCNM by every mean possible, given by the LeaveCode
+-- 1=Select Exit on circle
+-- 2=Winning the BC
+-- 3=Disconnected or warped out
+-- 4=Losing the BC
+-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
+-- from the core when a player disconnects or the time limit is up, etc
+
+function onBcnmLeave(player,instance,leavecode)
+        player:startEvent(0x7d02);
+end;
+
+function onEventUpdate(player,csid,option)
+-- print("bc update csid "..csid.." and option "..option);
+end;
+	
+function onEventFinish(player,csid,option)
+end;
\ No newline at end of file
Index: scripts/zones/Mine_Shaft_2716/npcs/Armoury_Crate.lua
===================================================================
--- scripts/zones/Mine_Shaft_2716/npcs/Armoury_Crate.lua	(revision 0)
+++ scripts/zones/Mine_Shaft_2716/npcs/Armoury_Crate.lua	(working copy)
@@ -0,0 +1,56 @@
+-----------------------------------
+-- Area: Mine_Shaft_2716
+-- NPC:  Armoury Crate
+-----------------------------------
+package.loaded["scripts/zones/Mine_Shaft_2716/TextIDs"] = nil;
+-------------------------------------
+
+require("scripts/globals/titles");
+require("scripts/globals/quests");
+require("scripts/zones/Mine_Shaft_2716/TextIDs");
+
+-----------------------------------
+
+-----------------------------------
+-- onTrade Action
+-----------------------------------
+
+function onTrade(player,npc,trade)
+end;
+
+-----------------------------------
+-- onTrigger Action
+-----------------------------------
+
+function onTrigger(player,npc)
+ local  CofferID = npc:getID();
+
+         if(CofferID==16830581)then
+            player:BCNMSetLoot(156,1,CofferID); -- bionic bug loot
+            player:getBCNMloot();
+			npc:setStatus(STATUS_DISAPPEAR);
+		 elseif(CofferID==16830582)then
+		    player:BCNMSetLoot(156,2,CofferID); -- bionic bug loot
+            player:getBCNMloot();
+			npc:setStatus(STATUS_DISAPPEAR);
+		 elseif(CofferID==16830583)then
+		    player:BCNMSetLoot(156,3,CofferID); -- bionic bug loot
+            player:getBCNMloot();
+			npc:setStatus(STATUS_DISAPPEAR);
+		 end
+			
+end;
+
+-----------------------------------
+-- onEventUpdate
+-----------------------------------
+
+function onEventUpdate(player,csid,option)
+end;
+
+-----------------------------------
+-- onEventFinish Action
+-----------------------------------
+
+function onEventFinish(player,csid,option)
+end;
Index: scripts/zones/Misareaux_Coast/npcs/_0p2.lua
===================================================================
--- scripts/zones/Misareaux_Coast/npcs/_0p2.lua	(revision 9017)
+++ scripts/zones/Misareaux_Coast/npcs/_0p2.lua	(working copy)
@@ -1,7 +1,7 @@
 -----------------------------------
--- Area: Misareaux Coast
---  NPC: Dilapidated Gate
--- Entrance to Riverne Site #B01
+--  Area: Misareaux Coast
+--  NPC:  Dilapidated Gate
+--  Entrance to Riverne Site #B01
 -----------------------------------
 package.loaded["scripts/zones/Misareaux_Coast/TextIDs"] = nil;
 -----------------------------------
@@ -21,17 +21,20 @@
 -----------------------------------
 
 function onTrigger(player,npc)
-	if (player:getCurrentMission(COP) == THE_SAVAGE and player:getVar("PromathiaStatus") == 0) then
-		player:startEvent(0x0008);
-	elseif (player:getCurrentMission(COP) == ANCIENT_VOWS and player:getVar("PromathiaStatus") == 0) then
+    if(player:getQuestStatus(JEUNO,STORMS_OF_FATE) == QUEST_ACCEPTED and player:getVar("StormOfFateStatus") == 0)then
+	       player:startEvent(0x022F);
+	elseif(player:getCurrentMission(COP) == THE_SAVAGE and player:getVar("PromathiaStatus") == 0)then
+	       player:startEvent(0x0008);
+	elseif(player:getCurrentMission(COP) == ANCIENT_VOWS and player:getVar("PromathiaStatus") == 0)then
 		player:startEvent(0x0006);
-	elseif (player:getCurrentMission(COP) == FLAMES_IN_THE_DARKNESS and player:getVar("PromathiaStatus") == 0) then
-		player:startEvent(0x000C);
-	elseif (player:getCurrentMission(COP) > AN_ETERNAL_MELODY or player:hasCompletedMission(COP,THE_LAST_VERSE)) then
+	elseif(player:getCurrentMission(COP) == FLAMES_IN_THE_DARKNESS and player:getVar("PromathiaStatus") == 0)then
+	   player:startEvent(0x000C);
+	elseif(player:getCurrentMission(COP) > AN_ETERNAL_MELODY or hasCompletedMission(COP,THE_LAST_VERSE))then
 		player:startEvent(0x0228);
 	else
 		player:messageSpecial(DOOR_CLOSED);
 	end
+	return 1;
 end;
 
 -----------------------------------
@@ -39,8 +42,8 @@
 -----------------------------------
 
 function onEventUpdate(player,csid,option)
-	-- printf("CSID: %u",csid);
-	-- printf("RESULT: %u",option);
+--printf("CSID: %u",csid);
+--printf("RESULT: %u",option);
 end;
 
 -----------------------------------
@@ -48,12 +51,14 @@
 -----------------------------------
 
 function onEventFinish(player,csid,option)
-	-- printf("CSID: %u",csid);
-	-- printf("RESULT: %u",option);
-	if (csid == 0x0006 or csid == 0x000C) then
+--printf("CSID: %u",csid);
+--printf("RESULT: %u",option);
+	if(csid == 0x0006 or csid == 0x000C)then
 		player:setVar("PromathiaStatus",1);
-	elseif (csid == 0x0008 and option == 1) then
+	elseif(csid == 0x0008 and option == 1)then
 		player:setVar("PromathiaStatus",1);
 		player:setPos(729,-20,410,88,0x1D); -- Go to Riverne #B01
+	elseif(csid == 0x022F)then
+	    player:setVar("StormOfFateStatus",1);
 	end
 end;
\ No newline at end of file
Index: scripts/zones/Misareaux_Coast/npcs/Spatial_Displacement.lua
===================================================================
--- scripts/zones/Misareaux_Coast/npcs/Spatial_Displacement.lua	(revision 9017)
+++ scripts/zones/Misareaux_Coast/npcs/Spatial_Displacement.lua	(working copy)
@@ -1,61 +1,61 @@
------------------------------------
---  Area: Misareaux Coast
---  NPC:  Spacial Displacement
---  Entrance to Riverne Site #A01 and #B01
------------------------------------
-package.loaded["scripts/zones/Misareaux_Coast/TextIDs"] = nil;
------------------------------------
-
-require("scripts/globals/missions");
-require("scripts/zones/Misareaux_Coast/TextIDs");
-
------------------------------------
--- onTrade
------------------------------------
-
-function onTrade(player,npc,trade)
-end;
-
------------------------------------
--- onTrigger
------------------------------------
-
-function onTrigger(player,npc)
-    
-	if(player:hasCompletedMission(COP,SHELTERING_DOUBT))then      
-		player:startEvent(0x0227); -- Access to Sites A & B
-	elseif(player:getCurrentMission(COP) == ANCIENT_VOWS and player:getVar("PromathiaStatus") == 1)then
-		player:startEvent(0x0008); 
-	else
-		player:startEvent(0x0226); -- Access to Site A Only
-	end
-	
-end;
-
------------------------------------
--- onEventUpdate
------------------------------------
-
-function onEventUpdate(player,csid,option)
---printf("CSID: %u",csid);
---printf("RESULT: %u",option);
-end;
-
------------------------------------
--- onEventFinish
------------------------------------
-
-function onEventFinish(player,csid,option)
---printf("CSID: %u",csid);
---printf("RESULT: %u",option);
-	
-	if(csid == 0x0008)then
-		player:setVar("PromathiaStatus",2);
-		player:setPos(732.55,-32.5,-506.544,90,30); -- Go to Riverne #A01 {R}
-	elseif((csid == 0x0227 or csid == 0x0226) and option == 1) then
-		player:setPos(732.55,-32.5,-506.544,90,30); -- Go to Riverne #A01 {R}
-	elseif(csid == 0x0227 and option == 2) then
-		player:setPos(729.749,-20.319,407.153,90,29); -- Go to Riverne #B01 {R}
-	end;
-	
+-----------------------------------
+--  Area: Misareaux Coast
+--  NPC:  Spacial Displacement
+--  Entrance to Riverne Site #A01 and #B01
+-----------------------------------
+package.loaded["scripts/zones/Misareaux_Coast/TextIDs"] = nil;
+-----------------------------------
+
+require("scripts/globals/missions");
+require("scripts/zones/Misareaux_Coast/TextIDs");
+
+-----------------------------------
+-- onTrade
+-----------------------------------
+
+function onTrade(player,npc,trade)
+end;
+
+-----------------------------------
+-- onTrigger
+-----------------------------------
+
+function onTrigger(player,npc)
+    
+	if(player:getCurrentMission(COP) > SHELTERING_DOUBT or hasCompletedMission(COP,THE_LAST_VERSE))then      
+		player:startEvent(0x0227); -- acces R site A and B
+	elseif(player:getCurrentMission(COP) == ANCIENT_VOWS and player:getVar("PromathiaStatus") == 1)then
+		player:startEvent(0x0008); 
+	else
+		player:startEvent(0x0226); -- acces R site A only	
+	end
+	
+end;
+
+-----------------------------------
+-- onEventUpdate
+-----------------------------------
+
+function onEventUpdate(player,csid,option)
+--printf("CSID: %u",csid);
+--printf("RESULT: %u",option);
+end;
+
+-----------------------------------
+-- onEventFinish
+-----------------------------------
+
+function onEventFinish(player,csid,option)
+--printf("CSID: %u",csid);
+--printf("RESULT: %u",option);
+	
+	if(csid == 0x0008)then
+		player:setVar("PromathiaStatus",2);
+		player:setPos(734,-32,-505,101,0x1E);-- Go to Riverne #A01
+	elseif((csid == 0x0227 or csid == 0x0226) and option == 1) then
+		player:setPos(734,-32,-505,101,0x1E); -- Go to Riverne #A01
+	elseif(csid == 0x0227 and option == 2) then
+		player:setPos(729,-20,410,88,0x1D); -- Go to Riverne #B01
+	end;
+	
 end;
\ No newline at end of file
Index: scripts/zones/Oldton_Movalpolos/npcs/Twinkbrix.lua
===================================================================
--- scripts/zones/Oldton_Movalpolos/npcs/Twinkbrix.lua	(revision 9017)
+++ scripts/zones/Oldton_Movalpolos/npcs/Twinkbrix.lua	(working copy)
@@ -24,7 +24,9 @@
 	elseif(player:hasKeyItem(SHAFT_GATE_OPERATING_DIAL) == false and tradeGil > 0 and tradeGil <= 10000) then
 		local maxRoll = tradeGil / 200;
 		local diceRoll = math.random((2),(100));
-		player:startEvent(0x0037, tradeGil, maxRoll, diceRoll, mineShaftWarpCost);		
+		player:startEvent(0x0037, tradeGil, maxRoll, diceRoll, mineShaftWarpCost);
+    elseif(player:hasKeyItem(SHAFT_2716_OPERATING_LEVER)==false and trade:hasItemQty(1781,1) and trade:getItemCount()==1)then		
+		 player:startEvent(0x0033,1781); -- <= SHAFT_2716_OPERATING_LEVER
 	end
 end;
 
@@ -54,8 +56,8 @@
 -----------------------------------
 
 function onEventFinish(player,csid,option)
- --printf("CSID: %u",csid);
- --printf("RESULT: %u",option); 
+-- printf("CSID: %u",csid);
+-- printf("RESULT: %u",option); 
  
  if(csid == 0x0037 and option == 1) then 	
    	player:addKeyItem(SHAFT_GATE_OPERATING_DIAL);
@@ -66,6 +68,10 @@
  elseif(csid == 0x0038 and option == 1) then
  	player:tradeComplete();
  	toMineShaft2716(player);
+ elseif(csid == 0x0033 and option == 0) then
+    player:tradeComplete();
+    player:addKeyItem(SHAFT_2716_OPERATING_LEVER);
+   	player:messageSpecial(KEYITEM_OBTAINED,SHAFT_2716_OPERATING_LEVER);
  end
  
 end;
\ No newline at end of file
Index: scripts/zones/Riverne-Site_A01/bcnms/ouryu_cometh.lua
===================================================================
--- scripts/zones/Riverne-Site_A01/bcnms/ouryu_cometh.lua	(revision 0)
+++ scripts/zones/Riverne-Site_A01/bcnms/ouryu_cometh.lua	(working copy)
@@ -0,0 +1,71 @@
+-----------------------------------
+-- Area: Riverne Site #A01
+-- Name: ouryu_cometh
+
+-----------------------------------
+package.loaded["scripts/zones/Riverne-Site_A01/TextIDs"] = nil;
+-----------------------------------
+
+require("scripts/globals/titles");
+require("scripts/globals/quests");
+require("scripts/globals/missions");
+require("scripts/zones/Riverne-Site_A01/TextIDs");
+
+-----------------------------------
+-- EXAMPLE SCRIPT
+-- 
+-- What should go here:
+-- giving key items, playing ENDING cutscenes
+--
+-- What should NOT go here:
+-- Handling of "battlefield" status, spawning of monsters,
+-- putting loot into treasure pool, 
+-- enforcing ANY rules (SJ/number of people/etc), moving
+-- chars around, playing entrance CSes (entrance CSes go in bcnm.lua)
+
+-- After registering the BCNM via bcnmRegister(bcnmid)
+function onBcnmRegister(player,instance)
+end;
+
+-- Physically entering the BCNM via bcnmEnter(bcnmid)
+function onBcnmEnter(player,instance)
+ if(ENABLE_COP_ZONE_CAP == 1)then
+   player:delStatusEffect(EFFECT_LEVEL_RESTRICTION);
+ end
+end;
+
+-- Leaving the BCNM by every mean possible, given by the LeaveCode
+-- 1=Select Exit on circle
+-- 2=Winning the BC
+-- 3=Disconnected or warped out
+-- 4=Losing the BC
+-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
+-- from the core when a player disconnects or the time limit is up, etc
+
+function onBcnmLeave(player,instance,leavecode)
+--printf("leavecode: %u",leavecode);
+	
+	if(leavecode == 2) then -- play end CS. Need time and battle id for record keeping + storage
+ 
+            player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,1,0);
+	
+	elseif(leavecode == 4) then
+		player:startEvent(0x7d02);
+	end
+	
+end;
+
+function onEventUpdate(player,csid,option)
+-- print("bc update csid "..csid.." and option "..option);
+end;
+	
+function onEventFinish(player,csid,option)
+-- print("bc finish csid "..csid.." and option "..option);
+
+	if(csid == 0x7d01 or csid ==0x7d02)then
+	    if(ENABLE_COP_ZONE_CAP == 1)then
+		 player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,40,0,0);
+		 end
+	end
+	
+end;
\ No newline at end of file
Index: scripts/zones/Riverne-Site_A01/mobs/Ouryu.lua
===================================================================
--- scripts/zones/Riverne-Site_A01/mobs/Ouryu.lua	(revision 9017)
+++ scripts/zones/Riverne-Site_A01/mobs/Ouryu.lua	(working copy)
@@ -11,11 +11,47 @@
 
 function onMobSpawn(mob)
 end;
+-----------------------------------
+-- onMobFight Action
+-----------------------------------
 
+function onMobFight(mob,target)
+     if(math.random(0,10)==1)then
+	   local petselect=16900312+math.random(0,6);
+	
+	   if(GetMobAction(petselect)==0)then
+	      pet =SpawnMob( petselect);
+          pet:updateEnmity( target );
+          pet:setPos( target:getXPos()+math.random(0,3), target:getYPos()+math.random(0,3), target:getZPos()+math.random(0,3) );
+	   end
+	 end
+end;
 -----------------------------------
 -- onMobDeath
 -----------------------------------
-
 function onMobDeath(mob, killer)
-	killer:addTitle(OURYU_OVERWHELMER);
-end;
\ No newline at end of file
+killer:addTitle(OURYU_OVERWHELMER);
+	    -- Despawn pets..
+	DespawnMob( 16900312 );
+	DespawnMob( 16900313 );
+	DespawnMob( 16900315 );
+	DespawnMob( 16900316 );
+	DespawnMob( 16900317 );
+	DespawnMob( 16900318 );
+	    -- Reset popped pet var..
+   -- mob:resetLocalVars();
+ 
+end;
+function onMobDespawn( mob )
+ 
+	DespawnMob( 16900312 );
+	DespawnMob( 16900313 );
+	DespawnMob( 16900315 );
+	DespawnMob( 16900316 );
+	DespawnMob( 16900317 );
+	DespawnMob( 16900318 );
+    
+    -- Reset popped pet var..
+    --mob:resetLocalVars();
+ 
+end
\ No newline at end of file
Index: scripts/zones/Riverne-Site_A01/npcs/Spatial_Displacement.lua
===================================================================
--- scripts/zones/Riverne-Site_A01/npcs/Spatial_Displacement.lua	(revision 9017)
+++ scripts/zones/Riverne-Site_A01/npcs/Spatial_Displacement.lua	(working copy)
@@ -18,7 +18,7 @@
 	
 	local id = npc:getID();
 	local base = 16900334; -- (First Spacial Displacement in NPC_LIST)
-
+	
 	if(id == base) then 
 		player:startEvent(0x2);
 	elseif(id == base+1) then 
@@ -56,7 +56,7 @@
 	elseif(id == base+23) then 
 		player:startEvent(0x17);
 	elseif(id == base+24) then 
-		player:startEvent(0x18);
+		player:startEvent(0x18); -- ouryou cometh
 	elseif(id == base+25) then 
 		player:startEvent(0x19);
 	elseif(id == base+26) then 
@@ -105,8 +105,14 @@
 function onEventFinish(player,csid,option)
 --printf("CSID: %u",csid);
 --printf("RESULT: %u",option);
-	
-	if(csid == 0x23 and option == 1) then
+	if(csid==0x18 and option==1)then
+	   if(player:hasStatusEffect(EFFECT_BATTLEFIELD) == true)then
+	     player:bcnmLeave(1);
+	   end
+	   if(ENABLE_COP_ZONE_CAP == 1)then
+	      player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,40,0,0);
+       end
+	elseif(csid == 0x23 and option == 1) then
 		player:setPos(12.527,0.345,-539.602,127,31); -- to Monarch Linn (Retail confirmed)
 	elseif(csid == 0x0A and option == 1) then
 		player:setPos(-538.526,-29.5,359.219,255,25); -- back to Misareaux Coast (Retail confirmed)
Index: scripts/zones/Riverne-Site_A01/npcs/Unstable_Displacement.lua
===================================================================
--- scripts/zones/Riverne-Site_A01/npcs/Unstable_Displacement.lua	(revision 9017)
+++ scripts/zones/Riverne-Site_A01/npcs/Unstable_Displacement.lua	(working copy)
@@ -14,6 +14,8 @@
 -----------------------------------
 
 function onTrade(player,npc,trade)
+  if(TradeBCNM(player,player:getZoneID(),trade,npc))then
+   end
 end;
 
 -----------------------------------
@@ -21,7 +23,11 @@
 -----------------------------------
 
 function onTrigger(player,npc)
-	player:messageSpecial(SPACE_SEEMS_DISTORTED);
+    if(EventTriggerBCNM(player,npc))then
+        return 1 ;	
+    else
+	    player:messageSpecial(SPACE_SEEMS_DISTORTED);
+	end
 end;
 
 -----------------------------------
@@ -31,6 +37,9 @@
 function onEventUpdate(player,csid,option)
 --printf("CSID: %u",csid);
 --printf("RESULT: %u",option);
+	if(EventUpdateBCNM(player,csid,option))then
+		return;
+	end
 end;
 
 -----------------------------------
@@ -40,4 +49,7 @@
 function onEventFinish(player,csid,option)
 --printf("CSID: %u",csid);
 --printf("RESULT: %u",option);
+    if(EventFinishBCNM(player,csid,option))then
+		return;
+	end
 end;
\ No newline at end of file
Index: scripts/zones/Riverne-Site_B01/bcnms/storms_of_fate.lua
===================================================================
--- scripts/zones/Riverne-Site_B01/bcnms/storms_of_fate.lua	(revision 0)
+++ scripts/zones/Riverne-Site_B01/bcnms/storms_of_fate.lua	(working copy)
@@ -0,0 +1,83 @@
+-----------------------------------
+-- Area: Riverne Site #B01
+-- Name: storms_of_fate
+
+-----------------------------------
+package.loaded["scripts/zones/Riverne-Site_B01/TextIDs"] = nil;
+-----------------------------------
+
+require("scripts/globals/titles");
+require("scripts/globals/quests");
+require("scripts/globals/missions");
+require("scripts/zones/Riverne-Site_B01/TextIDs");
+
+-----------------------------------
+-- EXAMPLE SCRIPT
+-- 
+-- What should go here:
+-- giving key items, playing ENDING cutscenes
+--
+-- What should NOT go here:
+-- Handling of "battlefield" status, spawning of monsters,
+-- putting loot into treasure pool, 
+-- enforcing ANY rules (SJ/number of people/etc), moving
+-- chars around, playing entrance CSes (entrance CSes go in bcnm.lua)
+
+-- After registering the BCNM via bcnmRegister(bcnmid)
+function onBcnmRegister(player,instance)
+end;
+
+-- Physically entering the BCNM via bcnmEnter(bcnmid)
+function onBcnmEnter(player,instance)
+ if(ENABLE_COP_ZONE_CAP == 1)then
+   player:delStatusEffect(EFFECT_LEVEL_RESTRICTION);
+ end
+end;
+
+-- Leaving the BCNM by every mean possible, given by the LeaveCode
+-- 1=Select Exit on circle
+-- 2=Winning the BC
+-- 3=Disconnected or warped out
+-- 4=Losing the BC
+-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
+-- from the core when a player disconnects or the time limit is up, etc
+
+function onBcnmLeave(player,instance,leavecode)
+--printf("leavecode: %u",leavecode);
+	
+	if(leavecode == 2) then -- play end CS. Need time and battle id for record keeping + storage
+        if(player:getQuestStatus(JEUNO,STORMS_OF_FATE) == QUEST_ACCEPTED and player:getVar("StormOfFateStatus") == 2) then 
+            player:setVar("StormOfFateStatus",3);
+			if(player:hasKeyItem(WHISPER_OF_THE_WYRMKING) == false) then 
+				player:addKeyItem(WHISPER_OF_THE_WYRMKING);
+				player:messageSpecial(KEYITEM_OBTAINED,WHISPER_OF_THE_WYRMKING);
+			end
+			player:startEvent(0x7d01,0,0,0,instance:getTimeInside(),0,0,0);       
+		else
+            player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,1,1);
+		end
+	elseif(leavecode == 4) then
+		player:startEvent(0x7d02);
+	end
+	
+end;
+
+function onEventUpdate(player,csid,option)
+-- print("bc update csid "..csid.." and option "..option);
+end;
+	
+function onEventFinish(player,csid,option)
+-- print("bc finish csid "..csid.." and option "..option);
+
+	if(csid == 0x7d01)then
+		player:setPos(-608,4,690,150);
+	    if(ENABLE_COP_ZONE_CAP == 1)then
+		 player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,50,0,0);
+	    end	
+    elseif(csid ==0x7d02)then
+		if(ENABLE_COP_ZONE_CAP == 1)then
+		   player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,50,0,0);	
+	   end	
+	end
+	
+end;
\ No newline at end of file
Index: scripts/zones/Riverne-Site_B01/bcnms/wyrmking_descends.lua
===================================================================
--- scripts/zones/Riverne-Site_B01/bcnms/wyrmking_descends.lua	(revision 0)
+++ scripts/zones/Riverne-Site_B01/bcnms/wyrmking_descends.lua	(working copy)
@@ -0,0 +1,69 @@
+-----------------------------------
+-- Area: Riverne Site #B01
+-- Name: wyrmking_descends
+
+-----------------------------------
+package.loaded["scripts/zones/Riverne-Site_B01/TextIDs"] = nil;
+-----------------------------------
+
+require("scripts/globals/titles");
+require("scripts/globals/quests");
+require("scripts/globals/missions");
+require("scripts/zones/Riverne-Site_B01/TextIDs");
+
+-----------------------------------
+-- EXAMPLE SCRIPT
+-- 
+-- What should go here:
+-- giving key items, playing ENDING cutscenes
+--
+-- What should NOT go here:
+-- Handling of "battlefield" status, spawning of monsters,
+-- putting loot into treasure pool, 
+-- enforcing ANY rules (SJ/number of people/etc), moving
+-- chars around, playing entrance CSes (entrance CSes go in bcnm.lua)
+
+-- After registering the BCNM via bcnmRegister(bcnmid)
+function onBcnmRegister(player,instance)
+end;
+
+-- Physically entering the BCNM via bcnmEnter(bcnmid)
+function onBcnmEnter(player,instance)
+ if(ENABLE_COP_ZONE_CAP == 1)then
+   player:delStatusEffect(EFFECT_LEVEL_RESTRICTION);
+ end
+end;
+
+-- Leaving the BCNM by every mean possible, given by the LeaveCode
+-- 1=Select Exit on circle
+-- 2=Winning the BC
+-- 3=Disconnected or warped out
+-- 4=Losing the BC
+-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
+-- from the core when a player disconnects or the time limit is up, etc
+
+function onBcnmLeave(player,instance,leavecode)
+--printf("leavecode: %u",leavecode);
+	
+
+	if(leavecode == 2) then -- play end CS. Need time and battle id for record keeping + storage
+		player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,1,0);
+	elseif(leavecode == 4) then
+		player:startEvent(0x7d02);
+	end
+end;
+
+function onEventUpdate(player,csid,option)
+-- print("bc update csid "..csid.." and option "..option);
+end;
+	
+function onEventFinish(player,csid,option)
+-- print("bc finish csid "..csid.." and option "..option);
+ if(csid == 0x7d01 or csid == 0x7d02)then
+	if(ENABLE_COP_ZONE_CAP == 1)then
+		player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,50,0,0);
+		
+	end	
+  end
+	
+end;
\ No newline at end of file
Index: scripts/zones/Riverne-Site_B01/mobs/Bahamut.lua
===================================================================
--- scripts/zones/Riverne-Site_B01/mobs/Bahamut.lua	(revision 9017)
+++ scripts/zones/Riverne-Site_B01/mobs/Bahamut.lua	(working copy)
@@ -10,12 +10,217 @@
 -----------------------------------
 
 function onMobSpawn(mob)
+  if( mob:getID()== 16896157)then -- The Wyrmking Descends
+    -- mob:getMobMod();
+  end
 end;
+-----------------------------------
+-- onMobFight Action
+-----------------------------------
+function onMobFight( mob, target )
+local mobhp = mob:getHPP();
+local ChosenPet = 0;
+local rand = 0;
+local Pet={0,0,0,0};
+local SummonNumber=0;
+local FlareNumber  = mob:getLocalVar("FlareNumber");
+ if( mob:getID()== 16896157)then -- The Wyrmking Descends
+        Pet[0] = mob:getLocalVar("Ouryu"); --16896158 group 799
+	    Pet[1]  = mob:getLocalVar("Tiamat");  --16896159 group 806
+        Pet[2] = mob:getLocalVar("Jormungand"); --16896160 group 794
+        Pet[3]  = mob:getLocalVar("Vrtra"); --16896161 group 808
+	    SummonNumber  = mob:getLocalVar("BahSummon");
 
+
+		if(Pet[0]==0 or Pet[1]==0 or Pet[2]==0 or Pet[3]==0 )then
+		  repeat
+		     ChosenPet = 16896158+math.random( 0, 3 );
+		  until(ChosenPet ~= Pet[0] and ChosenPet ~= Pet[1]and ChosenPet ~= Pet[2]and ChosenPet ~= Pet[3] )
+        end
+		
+		
+	if( mobhp < 81 and SummonNumber == 0 and ChosenPet ~= 0)then
+	    mob:setLocalVar("BahSummon", SummonNumber+1);
+		   switch (ChosenPet): caseof {
+                [16896158] = function (x) 
+	            mob:setLocalVar("Ouryu",16896158);
+				end, 
+                [16896159] = function (x) 
+				mob:setLocalVar("Tiamat",16896159);
+				end, 
+                [16896160] = function (x) 
+				mob:setLocalVar("Jormungand",16896160);
+				end, 
+                [16896161] = function (x)
+				mob:setLocalVar("Vrtra",16896161);
+				end, 
+            }
+	    local pet =SpawnMob( ChosenPet );
+        pet:updateEnmity( target );
+        pet:setPos( mob:getXPos(), mob:getYPos(), mob:getZPos() );
+		
+	elseif( mobhp < 61 and SummonNumber == 1 and ChosenPet ~= 0)then
+	    mob:setLocalVar("BahSummon", SummonNumber+1);
+			   switch (ChosenPet): caseof {
+                [16896158] = function (x) 
+	            mob:setLocalVar("Ouryu",16896158);
+				end, 
+                [16896159] = function (x) 
+				mob:setLocalVar("Tiamat",16896159);
+				end, 
+                [16896160] = function (x) 
+				mob:setLocalVar("Jormungand",16896160);
+				end, 
+                [16896161] = function (x)
+				mob:setLocalVar("Vrtra",16896161);
+				end, 
+            }
+	    local pet =SpawnMob( ChosenPet );
+        pet:updateEnmity( target );
+        pet:setPos( mob:getXPos(), mob:getYPos(), mob:getZPos() );
+		
+	elseif(mobhp < 41 and SummonNumber == 2 and ChosenPet ~= 0)then
+	    mob:setLocalVar("BahSummon", SummonNumber+1);
+			   switch (ChosenPet): caseof {
+                [16896158] = function (x) 
+	            mob:setLocalVar("Ouryu",16896158);
+				end, 
+                [16896159] = function (x) 
+				mob:setLocalVar("Tiamat",16896159);
+				end, 
+                [16896160] = function (x) 
+				mob:setLocalVar("Jormungand",16896160);
+				end,
+                [16896161] = function (x)
+				mob:setLocalVar("Vrtra",16896161);
+				end, 
+            }
+	    local pet =SpawnMob( ChosenPet );
+        pet:updateEnmity( target );
+        pet:setPos( mob:getXPos(), mob:getYPos(), mob:getZPos() );
+		
+	elseif( mobhp < 21 and SummonNumber ==3 and ChosenPet ~= 0)then
+	    mob:setLocalVar("BahSummon", SummonNumber+1);
+			   switch (ChosenPet): caseof {
+                [16896158] = function (x) 
+	            mob:setLocalVar("Ouryu",16896158);
+				end, 
+                [16896159] = function (x) 
+				mob:setLocalVar("Tiamat",16896159);
+				end,
+                [16896160] = function (x) 
+				mob:setLocalVar("Jormungand",16896160);
+				end,
+                [16896161] = function (x)
+				mob:setLocalVar("Vrtra",16896161);
+				end, 
+            }
+	    local pet =SpawnMob( ChosenPet );
+        pet:updateEnmity( target );
+        pet:setPos( mob:getXPos(), mob:getYPos(), mob:getZPos() );
+	end
+   if( mobhp < 91 and FlareNumber == 0)then
+     mob:setLocalVar("SetMegaflare",1);
+     mob:useMobAbility(1295); -- Megaflare
+     mob:setLocalVar("FlareNumber",FlareNumber+1);
+   elseif( mobhp < 81 and FlareNumber == 1)then
+     mob:setLocalVar("SetMegaflare",1);
+     mob:setLocalVar("FlareNumber",FlareNumber+1);
+     mob:useMobAbility(1295); -- Megaflare
+   elseif( mobhp < 71 and FlareNumber == 2)then
+     mob:setLocalVar("SetMegaflare",1);
+     mob:setLocalVar("FlareNumber",FlareNumber+1);
+     mob:useMobAbility(1295); -- Megaflare
+   elseif( mobhp < 61 and FlareNumber == 3)then
+     mob:setLocalVar("SetGigaflare",1);
+     mob:setLocalVar("FlareNumber",FlareNumber+1);
+     mob:useMobAbility(1296); -- Gigaflare
+   elseif( mobhp < 51 and FlareNumber == 4)then
+     mob:setLocalVar("SetGigaflare",1);
+     mob:setLocalVar("FlareNumber",FlareNumber+1);
+     mob:useMobAbility(1296); -- Gigaflare
+   elseif( mobhp < 41 and FlareNumber == 5)then
+     mob:setLocalVar("SetGigaflare",1);
+     mob:setLocalVar("FlareNumber",FlareNumber+1);
+     mob:useMobAbility(1296); -- Gigaflare
+   elseif( mobhp < 31 and FlareNumber == 6)then
+     mob:setLocalVar("SetGigaflare",1);
+     mob:setLocalVar("FlareNumber",FlareNumber+1);
+	 mob:useMobAbility(1296); -- Gigaflare
+   elseif( mobhp < 21 and FlareNumber == 7)then
+     mob:setLocalVar("SetGigaflare",1);
+     mob:setLocalVar("FlareNumber",FlareNumber+1);
+	 mob:useMobAbility(1296); -- Gigaflare
+   elseif( mobhp < 11 and FlareNumber == 8)then
+     mob:setLocalVar("SetTeraflare",1);
+     mob:setLocalVar("FlareNumber",FlareNumber+1);
+     mob:useMobAbility(1297); -- Teraflare
+   end
+  else --- storm of fate
+   if( mobhp < 91 and FlareNumber == 0)then
+     mob:setLocalVar("SetMegaflare",1);
+     mob:useMobAbility(1295); -- Megaflare
+     mob:setLocalVar("FlareNumber",FlareNumber+1);
+   elseif( mobhp < 81 and FlareNumber == 1)then
+     mob:setLocalVar("SetMegaflare",1);
+     mob:setLocalVar("FlareNumber",FlareNumber+1);
+     mob:useMobAbility(1295); -- Megaflare
+   elseif( mobhp < 71 and FlareNumber == 2)then
+     mob:setLocalVar("SetMegaflare",1);
+     mob:setLocalVar("FlareNumber",FlareNumber+1);
+     mob:useMobAbility(1295); -- Megaflare
+   elseif( mobhp < 61 and FlareNumber == 3)then
+     mob:setLocalVar("SetMegaflare",1);
+     mob:setLocalVar("FlareNumber",FlareNumber+1);
+     mob:useMobAbility(1295); -- Megaflare
+   elseif( mobhp < 51 and FlareNumber == 4)then
+     mob:setLocalVar("SetMegaflare",1);
+     mob:setLocalVar("FlareNumber",FlareNumber+1);
+     mob:useMobAbility(1295); -- Megaflare
+   elseif( mobhp < 41 and FlareNumber == 5)then
+     mob:setLocalVar("SetMegaflare",1);
+     mob:setLocalVar("FlareNumber",FlareNumber+1);
+     mob:useMobAbility(1295); -- Megaflare
+   elseif( mobhp < 31 and FlareNumber == 6)then
+     mob:setLocalVar("SetMegaflare",1);
+     mob:setLocalVar("FlareNumber",FlareNumber+1);
+	 mob:useMobAbility(1295); -- Megaflare
+   elseif( mobhp < 21 and FlareNumber == 7)then
+     mob:setLocalVar("SetMegaflare",1);
+     mob:setLocalVar("FlareNumber",FlareNumber+1);
+	 mob:useMobAbility(1295); -- Megaflare
+   elseif( mobhp < 11 and FlareNumber == 8)then
+     mob:setLocalVar("SetGigaflare",1);
+     mob:setLocalVar("FlareNumber",FlareNumber+1);
+     mob:useMobAbility(1296); -- Gigaflare
+   end
+  end
+end
 -----------------------------------
 -- onMobDeath
 -----------------------------------
 
 function onMobDeath(mob, killer)
-	killer:addTitle(WYRM_ASTONISHER);
-end;
\ No newline at end of file
+  if( mob:getID()== 16896157)then -- The Wyrmking Descends
+  	killer:addTitle(WYRM_ASTONISHER);
+	    -- Despawn pets..
+	DespawnMob( 16896158 );
+	DespawnMob( 16896159 );
+	DespawnMob( 16896160 );
+	DespawnMob( 16896161 );
+	    -- Reset popped pet var..
+    mob:resetLocalVars();
+  end
+end;
+function onMobDespawn( mob )
+  if( mob:getID()== 16896157)then -- The Wyrmking Descends
+    -- Despawn pets..
+	DespawnMob( 16896158 );
+	DespawnMob( 16896159 );
+	DespawnMob( 16896160 );
+	DespawnMob( 16896161 );
+    
+    -- Reset popped pet var..
+    mob:resetLocalVars();
+  end
+end
\ No newline at end of file
Index: scripts/zones/Riverne-Site_B01/mobs/Ouryu.lua
===================================================================
--- scripts/zones/Riverne-Site_B01/mobs/Ouryu.lua	(revision 0)
+++ scripts/zones/Riverne-Site_B01/mobs/Ouryu.lua	(working copy)
@@ -0,0 +1,57 @@
+-----------------------------------
+-- Area: Riverne - Site B01 (BCNM)
+-- NPC:  Ouryu
+-----------------------------------
+
+require("scripts/globals/titles");
+
+-----------------------------------
+-- onMobSpawn Action
+-----------------------------------
+
+function onMobSpawn(mob)
+end;
+-----------------------------------
+-- onMobFight Action
+-----------------------------------
+function onMobFight( mob, target )
+
+
+   if( mob:getID()== 16896158)then -- The Wyrmking Descends
+ 
+     if(math.random(0,10)==1)then
+	   local petselect=16896162+math.random(0,5);
+	
+	   if(GetMobAction(petselect)==0)then
+	      pet =SpawnMob( petselect);
+          pet:updateEnmity( target );
+          pet:setPos( target:getXPos()+math.random(0,3), target:getYPos()+math.random(0,3), target:getZPos()+math.random(0,3) );
+	   end
+	 end
+ 
+
+   end
+end
+-----------------------------------
+-- onMobDeath
+-----------------------------------
+
+function onMobDeath(mob, killer)
+	    -- Despawn pets..
+	DespawnMob( 16896162 );
+	DespawnMob( 16896163 );
+	DespawnMob( 16896164 );
+	DespawnMob( 16896165 );
+	DespawnMob( 16896166 );
+	DespawnMob( 16896167 );
+    
+end;
+function onMobDespawn( mob )
+    -- Despawn pets..
+	DespawnMob( 16896162 );
+	DespawnMob( 16896163 );
+	DespawnMob( 16896164 );
+	DespawnMob( 16896165 );
+    DespawnMob( 16896166 );
+	DespawnMob( 16896167 );
+end
\ No newline at end of file
Index: scripts/zones/Riverne-Site_B01/mobs/Vrtra.lua
===================================================================
--- scripts/zones/Riverne-Site_B01/mobs/Vrtra.lua	(revision 0)
+++ scripts/zones/Riverne-Site_B01/mobs/Vrtra.lua	(working copy)
@@ -0,0 +1,57 @@
+-----------------------------------
+-- Area: Riverne - Site B01 (BCNM)
+-- NPC:  Vrtra
+-----------------------------------
+
+require("scripts/globals/titles");
+
+-----------------------------------
+-- onMobSpawn Action
+-----------------------------------
+
+function onMobSpawn(mob)
+end;
+-----------------------------------
+-- onMobFight Action
+-----------------------------------
+function onMobFight( mob, target )
+
+
+   if( mob:getID()== 16896161)then -- The Wyrmking Descends
+ 
+     if(math.random(0,10)==1)then
+	   local petselect=16896168+math.random(0,5);
+	
+	   if(GetMobAction(petselect)==0)then
+	      pet =SpawnMob( petselect);
+          pet:updateEnmity( target );
+          pet:setPos( target:getXPos()+math.random(-3,3), target:getYPos()+math.random(-3,3), target:getZPos()+math.random(-3,3) );
+	   end
+	 end
+ 
+
+   end
+end
+-----------------------------------
+-- onMobDeath
+-----------------------------------
+
+function onMobDeath(mob, killer)
+	    -- Despawn pets..
+	DespawnMob( 16896168 );
+	DespawnMob( 16896169 );
+	DespawnMob( 16896170 );
+	DespawnMob( 16896171 );
+	DespawnMob( 16896172 );
+	DespawnMob( 16896173 );
+    
+end;
+function onMobDespawn( mob )
+    -- Despawn pets..
+	DespawnMob( 16896168 );
+	DespawnMob( 16896169 );
+	DespawnMob( 16896170 );
+	DespawnMob( 16896171 );
+	DespawnMob( 16896172 );
+	DespawnMob( 16896173 );
+end
\ No newline at end of file
Index: scripts/zones/Riverne-Site_B01/npcs/Spatial_Displacement.lua
===================================================================
--- scripts/zones/Riverne-Site_B01/npcs/Spatial_Displacement.lua	(revision 9017)
+++ scripts/zones/Riverne-Site_B01/npcs/Spatial_Displacement.lua	(working copy)
@@ -112,8 +112,14 @@
 function onEventFinish(player,csid,option)
 --printf("CSID: %u",csid);
 --printf("RESULT: %u",option);
-	
-	if(csid == 0x21 and option == 1) then
+    if(csid==0x23 and option==1)then
+	   if(player:hasStatusEffect(EFFECT_BATTLEFIELD) == true)then
+	     player:bcnmLeave(1);
+	   end
+	   if(ENABLE_COP_ZONE_CAP == 1)then
+	      player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,50,0,0);
+       end
+	elseif(csid == 0x21 and option == 1) then
 		player:setPos(12.527,0.345,-539.602,127,31); -- to Monarch Linn (Retail confirmed)
 	elseif(csid == 0xA and option == 1) then
 		player:setPos(-538.526,-29.5,359.219,255,25); -- back to Misareaux Coast (Retail confirmed)
Index: scripts/zones/Riverne-Site_B01/npcs/Unstable_Displacement.lua
===================================================================
--- scripts/zones/Riverne-Site_B01/npcs/Unstable_Displacement.lua	(revision 9017)
+++ scripts/zones/Riverne-Site_B01/npcs/Unstable_Displacement.lua	(working copy)
@@ -14,6 +14,9 @@
 -----------------------------------
 
 function onTrade(player,npc,trade)
+
+   if(TradeBCNM(player,player:getZoneID(),trade,npc))then
+   end
 end;
 
 -----------------------------------
@@ -21,7 +24,13 @@
 -----------------------------------
 
 function onTrigger(player,npc)
-	player:messageSpecial(SPACE_SEEMS_DISTORTED);
+    if(player:getQuestStatus(JEUNO,STORMS_OF_FATE) == QUEST_ACCEPTED and player:getVar("StormOfFateStatus") == 1)then
+	   player:startEvent(0x0001);
+	elseif(EventTriggerBCNM(player,npc))then
+        return 1 ;	
+    else
+     player:messageSpecial(SPACE_SEEMS_DISTORTED);
+	end
 end;
 
 -----------------------------------
@@ -29,6 +38,9 @@
 -----------------------------------
 
 function onEventUpdate(player,csid,option)
+	if(EventUpdateBCNM(player,csid,option))then
+		return;
+	end
 --printf("CSID: %u",csid);
 --printf("RESULT: %u",option);
 end;
@@ -40,4 +52,10 @@
 function onEventFinish(player,csid,option)
 --printf("CSID: %u",csid);
 --printf("RESULT: %u",option);
+  if(csid==0x0001)then
+     player:setVar("StormOfFateStatus",2);
+  elseif(EventFinishBCNM(player,csid,option))then
+		return;
+	end
+ 
 end;
\ No newline at end of file
Index: scripts/zones/RuLude_Gardens/Zone.lua
===================================================================
--- scripts/zones/RuLude_Gardens/Zone.lua	(revision 9017)
+++ scripts/zones/RuLude_Gardens/Zone.lua	(working copy)
@@ -68,7 +68,11 @@
     elseif (regionID==1 and player:getCurrentMission(COP) == DAWN ) then
         if (player:getVar("COP_3-taru_story") == 2 and player:getVar("COP_shikarees_story") == 1 and player:getVar("COP_louverance_story") == 3 and player:getVar("COP_tenzen_story") == 1 and player:getVar("COP_jabbos_story") == 1) then
             player:startEvent(0x007A);
-        end
+		end
+	elseif(regionID==1 and player:getQuestStatus(JEUNO,STORMS_OF_FATE) == QUEST_AVAILABLE and ( (player:getCurrentMission(COP) == DAWN and player:getVar("PromathiaStatus") == 7)or(player:getCurrentMission(COP) > DAWN)))then
+	    player:startEvent(0x008E);
+    elseif(regionID==1 and player:getQuestStatus(JEUNO,STORMS_OF_FATE) == QUEST_ACCEPTED and player:getVar("StormOfFateStatus") == 3)then
+       	player:startEvent(0x008F);
     end
 end;
 -----------------------------------
@@ -119,5 +123,10 @@
         player:setVar("COP_louverance_story",0);
         player:setVar("COP_tenzen_story",0);
         player:setVar("COP_jabbos_story",0);
+	elseif (csid == 0x008E)then	
+	    player:addQuest(JEUNO,STORMS_OF_FATE);
+	elseif (csid == 0x008F)then	
+	     player:completeQuest(JEUNO,STORMS_OF_FATE);
+		 player:setVar("StormOfFateStatus",0);
     end
 end;
\ No newline at end of file
Index: sql/bcnm_battlefield.sql
===================================================================
--- sql/bcnm_battlefield.sql	(revision 9017)
+++ sql/bcnm_battlefield.sql	(working copy)
@@ -594,6 +594,9 @@
 INSERT INTO `bcnm_battlefield` VALUES ('736', '3', '16830478', '3');
 INSERT INTO `bcnm_battlefield` VALUES ('736', '3', '16830477', '3');
 INSERT INTO `bcnm_battlefield` VALUES ('736', '3', '16830479', '3');
+INSERT INTO `bcnm_battlefield` VALUES ('738', '1', '16830501', '3');
+INSERT INTO `bcnm_battlefield` VALUES ('738', '2', '16830503', '3');
+INSERT INTO `bcnm_battlefield` VALUES ('738', '3', '16830505', '3');
 INSERT INTO `bcnm_battlefield` VALUES ('768', '1', '16846849', '3');
 INSERT INTO `bcnm_battlefield` VALUES ('768', '2', '16846850', '3');
 INSERT INTO `bcnm_battlefield` VALUES ('768', '3', '16846851', '3');
@@ -612,6 +615,9 @@
 INSERT INTO `bcnm_battlefield` VALUES ('864', '3', '16871439', '3');
 INSERT INTO `bcnm_battlefield` VALUES ('864', '3', '16871440', '3');
 INSERT INTO `bcnm_battlefield` VALUES ('864', '3', '16871445', '3');
+INSERT INTO `bcnm_battlefield` VALUES ('896', '1', '16896156', '3');
+INSERT INTO `bcnm_battlefield` VALUES ('897', '1', '16896157', '3');
+INSERT INTO `bcnm_battlefield` VALUES ('928', '1', '16900314', '3');
 INSERT INTO `bcnm_battlefield` VALUES ('960', '1', '16904193', '3');
 INSERT INTO `bcnm_battlefield` VALUES ('960', '1', '16904194', '3');
 INSERT INTO `bcnm_battlefield` VALUES ('960', '1', '16904195', '3');
Index: sql/bcnm_info.sql
===================================================================
--- sql/bcnm_info.sql	(revision 9017)
+++ sql/bcnm_info.sql	(working copy)
@@ -233,8 +233,8 @@
 INSERT INTO `bcnm_info` VALUES ('865', '23', 'pulling_the_plug', null, null, '1800', '50', '18', '0', '15');
 INSERT INTO `bcnm_info` VALUES ('866', '23', 'empty_aspirations', null, null, '900', '0', '6', '0', '5');
 INSERT INTO `bcnm_info` VALUES ('896', '29', 'storms_of_fate', null, null, '1800', '0', '18', '0', '7');
-INSERT INTO `bcnm_info` VALUES ('897', '29', 'wyrmking_descends', null, null, '3600', '0', '18', '0', '15');
-INSERT INTO `bcnm_info` VALUES ('928', '30', 'ouryu_cometh', null, null, '3600', '0', '18', '0', '15');
+INSERT INTO `bcnm_info` VALUES ('897', '29', 'wyrmking_descends', null, null, '3600', '0', '18', '0', '7');
+INSERT INTO `bcnm_info` VALUES ('928', '30', 'ouryu_cometh', null, null, '3600', '0', '18', '0', '7');
 INSERT INTO `bcnm_info` VALUES ('960', '31', 'ancient_vows', null, null, '1800', '40', '6', '0', '5');
 INSERT INTO `bcnm_info` VALUES ('961', '31', 'savage', null, null, '1800', '50', '6', '0', '5');
 INSERT INTO `bcnm_info` VALUES ('962', '31', 'fire_in_the_sky', null, null, '900', '40', '18', '0', '15');
Index: sql/bcnm_loot.sql
===================================================================
--- sql/bcnm_loot.sql	(revision 9017)
+++ sql/bcnm_loot.sql	(working copy)
@@ -1662,6 +1662,24 @@
 INSERT INTO `bcnm_loot` VALUES ('155', '2658', '400', '6'); -- COR
 INSERT INTO `bcnm_loot` VALUES ('155', '1940', '200', '6'); -- THF
 
+-- ENM Bionic bug
+INSERT INTO `bcnm_loot` VALUES ('156', '1767', '326', '0');
+INSERT INTO `bcnm_loot` VALUES ('156', '1762', '368', '0');
+INSERT INTO `bcnm_loot` VALUES ('156', '1771', '316', '0');
+INSERT INTO `bcnm_loot` VALUES ('156', '1842', '105', '1');
+INSERT INTO `bcnm_loot` VALUES ('156', '18009', '84', '2');
+INSERT INTO `bcnm_loot` VALUES ('156', '18056', '74', '2');
+INSERT INTO `bcnm_loot` VALUES ('156', '13648', '10', '2');
+INSERT INTO `bcnm_loot` VALUES ('156', '13695', '63', '2');
+INSERT INTO `bcnm_loot` VALUES ('156', '15195', '116', '2');
+INSERT INTO `bcnm_loot` VALUES ('156', '4748', '32', '2');
+INSERT INTO `bcnm_loot` VALUES ('156', '18009', '84', '3');
+INSERT INTO `bcnm_loot` VALUES ('156', '18056', '74', '3');
+INSERT INTO `bcnm_loot` VALUES ('156', '13648', '10', '3');
+INSERT INTO `bcnm_loot` VALUES ('156', '13695', '63', '3');
+INSERT INTO `bcnm_loot` VALUES ('156', '15195', '116', '3');
+INSERT INTO `bcnm_loot` VALUES ('156', '4748', '32', '3');
+
 -- ENM Like the Wind
 INSERT INTO `bcnm_loot` VALUES ('179','1763','30','1'); 
 INSERT INTO `bcnm_loot` VALUES ('179','1769','30','1'); 
Index: sql/bcnm_treasure_chests.sql
===================================================================
--- sql/bcnm_treasure_chests.sql	(revision 9017)
+++ sql/bcnm_treasure_chests.sql	(working copy)
@@ -92,6 +92,11 @@
 -- Boneyard Gully
 INSERT INTO `bcnm_treasure_chests` VALUES ('673', '1', '16810019');
 
+-- mine shaft
+INSERT INTO `bcnm_treasure_chests` VALUES ('738', '1', '16830581');
+INSERT INTO `bcnm_treasure_chests` VALUES ('738', '2', '16830582');
+INSERT INTO `bcnm_treasure_chests` VALUES ('738', '3', '16830583');
+
 -- Throne Room
 
 -- Chamber of Oracles
Index: sql/mob_droplist.sql
===================================================================
--- sql/mob_droplist.sql	(revision 9017)
+++ sql/mob_droplist.sql	(working copy)
@@ -16467,7 +16467,27 @@
 INSERT INTO `mob_droplist` VALUES (2723,0,2825,30);
 INSERT INTO `mob_droplist` VALUES (2723,0,19280,100);
 INSERT INTO `mob_droplist` VALUES (2724,0,1133,10);
-INSERT INTO `mob_droplist` VALUES (2724,0,1703,100);
+INSERT INTO `mob_droplist` VALUES (2724,0,1703,1000);
+INSERT INTO `mob_droplist` VALUES (2724,0,1703,1000);
+INSERT INTO `mob_droplist` VALUES (2724,0,1703,1000);
+INSERT INTO `mob_droplist` VALUES (2724,0,1110,800);
+INSERT INTO `mob_droplist` VALUES (2724,0,860,190);
+INSERT INTO `mob_droplist` VALUES (2724,0,836,180);
+INSERT INTO `mob_droplist` VALUES (2724,0,658,130);
+INSERT INTO `mob_droplist` VALUES (2724,0,722,210);
+INSERT INTO `mob_droplist` VALUES (2724,0,837,150);
+INSERT INTO `mob_droplist` VALUES (2724,0,1313,100);
+INSERT INTO `mob_droplist` VALUES (2724,0,4272,250);
+INSERT INTO `mob_droplist` VALUES (2724,0,903,200);
+INSERT INTO `mob_droplist` VALUES (2724,0,4486,550);
+INSERT INTO `mob_droplist` VALUES (2724,0,836,700);
+INSERT INTO `mob_droplist` VALUES (2724,0,1816,1000);
+INSERT INTO `mob_droplist` VALUES (2724,0,655,300);
+INSERT INTO `mob_droplist` VALUES (2724,0,903,400);
+INSERT INTO `mob_droplist` VALUES (2724,0,1311,156);
+INSERT INTO `mob_droplist` VALUES (2724,0,2108,1000);
+INSERT INTO `mob_droplist` VALUES (2724,0,17658,1000);
+INSERT INTO `mob_droplist` VALUES (2724,0,17799,300);
 INSERT INTO `mob_droplist` VALUES (2725,0,799,110);
 INSERT INTO `mob_droplist` VALUES (2725,0,842,170);
 INSERT INTO `mob_droplist` VALUES (2725,0,843,140);
@@ -32364,6 +32384,19 @@
 INSERT INTO `mob_droplist` VALUES (4521,0,2428,50);
 INSERT INTO `mob_droplist` VALUES (4521,0,2426,60);
 INSERT INTO `mob_droplist` VALUES (4521,0,2427,205);
+INSERT INTO `mob_droplist` VALUES (4522,0,1704,712);
+INSERT INTO `mob_droplist` VALUES (4522,0,1703,678);
+INSERT INTO `mob_droplist` VALUES (4522,0,647,864);
+INSERT INTO `mob_droplist` VALUES (4522,0,1714,576);
+INSERT INTO `mob_droplist` VALUES (4522,0,1713,593);
+INSERT INTO `mob_droplist` VALUES (4522,0,1816,746);
+INSERT INTO `mob_droplist` VALUES (4522,0,722,119);
+INSERT INTO `mob_droplist` VALUES (4522,0,1313,39);
+INSERT INTO `mob_droplist` VALUES (4522,0,17598,231);
+INSERT INTO `mob_droplist` VALUES (4522,0,17597,769);
+INSERT INTO `mob_droplist` VALUES (4522,0,15264,318);
+INSERT INTO `mob_droplist` VALUES (4522,0,18061,269);
+INSERT INTO `mob_droplist` VALUES (4522,0,15599,424);
 /*!40000 ALTER TABLE `mob_droplist` ENABLE KEYS */;
 UNLOCK TABLES;
 /*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
Index: sql/mob_groups.sql
===================================================================
--- sql/mob_groups.sql	(revision 9017)
+++ sql/mob_groups.sql	(working copy)
@@ -823,7 +823,7 @@
 INSERT INTO `mob_groups` VALUES (783,4112,28,1056,0,3667,0,0,55,55,0);
 INSERT INTO `mob_groups` VALUES (784,70,29,0,128,0,0,0,15,17,0);
 INSERT INTO `mob_groups` VALUES (785,71,29,330,4,41,0,0,57,64,0);
-INSERT INTO `mob_groups` VALUES (786,325,29,0,128,0,0,0,83,83,0);
+INSERT INTO `mob_groups` VALUES (786,325,29,0,128,0,26000,26000,83,83,0);
 INSERT INTO `mob_groups` VALUES (787,503,29,0,128,0,0,0,0,0,0);
 INSERT INTO `mob_groups` VALUES (788,513,29,86400,0,377,8000,0,56,60,0);
 INSERT INTO `mob_groups` VALUES (789,708,29,0,128,0,0,0,0,0,0);
@@ -831,21 +831,21 @@
 INSERT INTO `mob_groups` VALUES (791,2051,29,330,0,1766,0,0,58,60,0);
 INSERT INTO `mob_groups` VALUES (792,2060,29,86400,128,1776,7000,0,56,60,0);
 INSERT INTO `mob_groups` VALUES (793,2105,29,0,128,0,0,0,75,75,0);
-INSERT INTO `mob_groups` VALUES (794,2156,29,0,128,0,0,0,75,75,0);
+INSERT INTO `mob_groups` VALUES (794,2156,29,0,128,0,6500,5000,75,75,0);
 INSERT INTO `mob_groups` VALUES (795,2399,29,330,0,2049,2100,0,49,53,0);
 INSERT INTO `mob_groups` VALUES (796,2452,29,330,0,2095,0,0,55,58,0);
 INSERT INTO `mob_groups` VALUES (797,2882,29,330,0,2468,0,0,49,52,0);
 INSERT INTO `mob_groups` VALUES (798,2891,29,980,0,2477,0,0,56,58,0);
-INSERT INTO `mob_groups` VALUES (799,3070,29,0,128,0,0,0,75,75,0);
+INSERT INTO `mob_groups` VALUES (799,3070,29,0,128,0,6000,5000,75,75,0);
 INSERT INTO `mob_groups` VALUES (800,3124,29,0,128,0,0,0,75,75,0);
 INSERT INTO `mob_groups` VALUES (801,3199,29,0,0,0,0,0,0,0,0);
 INSERT INTO `mob_groups` VALUES (802,3242,29,330,0,2889,0,0,50,55,0);
 INSERT INTO `mob_groups` VALUES (803,3725,29,0,128,0,0,0,0,0,0);
 INSERT INTO `mob_groups` VALUES (804,3783,29,330,0,3377,0,0,54,57,0);
 INSERT INTO `mob_groups` VALUES (805,3912,29,330,4,3489,0,0,57,64,0);
-INSERT INTO `mob_groups` VALUES (806,3916,29,0,128,0,0,0,75,75,0);
+INSERT INTO `mob_groups` VALUES (806,3916,29,0,128,0,6500,5000,75,75,0);
 INSERT INTO `mob_groups` VALUES (807,4102,29,0,128,3661,10000,0,56,57,0);
-INSERT INTO `mob_groups` VALUES (808,4261,29,0,128,0,0,0,75,75,0);
+INSERT INTO `mob_groups` VALUES (808,4261,29,0,128,0,5500,5000,75,75,0);
 INSERT INTO `mob_groups` VALUES (809,4309,29,0,128,0,0,0,75,75,0);
 INSERT INTO `mob_groups` VALUES (810,4507,29,0,128,4352,0,0,75,75,0);
 INSERT INTO `mob_groups` VALUES (811,68,30,95040,0,38,0,0,44,45,0);
@@ -10966,9 +10966,9 @@
 INSERT INTO `mob_groups` VALUES (11196,1720,12,0,128,1469,0,0,71,73,0);
 -- gnoletrap Jugner S missing group
 INSERT INTO `mob_groups` VALUES (11197,5155,82,300,0,4481,0,0,89,91,0);
+-- bahamut V2
+INSERT INTO `mob_groups` VALUES (11198,325,29,0,128,4522,25000,25000,85,85,0);
 
-
-
 INSERT INTO `mob_groups` VALUES (12949,3083,24,86400,128,4478,0,0,45,46,0); -- True Padfoot spawn
 INSERT INTO `mob_groups` VALUES (12950,4534,45,0,0,0,0,0,92,94,0);
 INSERT INTO `mob_groups` VALUES (12951,4533,45,0,0,0,0,0,92,94,0);
Index: sql/mob_pools.sql
===================================================================
--- sql/mob_pools.sql	(revision 9017)
+++ sql/mob_pools.sql	(working copy)
@@ -379,7 +379,7 @@
 INSERT INTO `mob_pools` VALUES (322,'Badshah',242,0x0000340100000000000000000000000000000000,1,1,7,240,100,0,1,0,2,0,0,0,3,0,0,0,1,0);
 INSERT INTO `mob_pools` VALUES (323,'Baelfyr',0,0x0000650800000000000000000000000000000000,5,3,11,240,100,0,0,0,0,0,0,0,0,0,0,3,1,0);
 INSERT INTO `mob_pools` VALUES (324,'Baetyl_Quadav',202,0x00001F0400000000000000000000000000000000,3,3,3,265,100,0,258,1,0,0,0,1,133,0,0,1,1,0);
-INSERT INTO `mob_pools` VALUES (325,'Bahamut',263,0x00001B0500000000000000000000000000000000,1,1,7,240,100,0,16,0,16,0,32,100,157,0,0,0,1,0);
+INSERT INTO `mob_pools` VALUES (325,'Bahamut',449,0x00001B0500000000000000000000000000000000,4,5,7,240,100,0,16,0,2,1023,32,100,157,0,0,136,1,0);
 INSERT INTO `mob_pools` VALUES (326,'Bakka',165,0x0000BF0600000000000000000000000000000000,4,4,7,240,100,0,0,0,2,0,0,0,0,0,0,2,1,0);
 INSERT INTO `mob_pools` VALUES (327,'Bakru',178,0x00002C0100000000000000000000000000000000,2,2,7,360,100,0,0,0,0,0,0,0,3,0,0,0,1,0);
 INSERT INTO `mob_pools` VALUES (328,'Balam-Agab',71,0x00006F0100000000000000000000000000000000,3,3,11,240,100,0,257,0,2,0,32,7611,157,0,0,1,1,0);
Index: sql/mob_skill.sql
===================================================================
--- sql/mob_skill.sql	(revision 9017)
+++ sql/mob_skill.sql	(working copy)
@@ -3018,17 +3018,17 @@
 INSERT INTO `mob_skill` VALUES (2629,453,2021,'Beautiful_death',1,18.0,2000,1000,4,0,0,0);
 
 -- Bahamut 
-INSERT INTO `mob_skill` VALUES (1286,449,1133,'Trample',0,15.0,2000,1500,4,0,0,0);
-INSERT INTO `mob_skill` VALUES (1287,449,1134,'Tempest_wing',0,15.0,2000,1500,4,0,0,0);
-INSERT INTO `mob_skill` VALUES (1288,449,1139,'Touchdown',0,15.0,2000,1500,4,0,0,0);
-INSERT INTO `mob_skill` VALUES (1289,449,1135,'Sweeping_ Flail',0,15.0,2000,1500,4,0,0,0);
-INSERT INTO `mob_skill` VALUES (1290,449,1140,'Prodigious_spike',0,15.0,2000,1500,4,0,0,0);
-INSERT INTO `mob_skill` VALUES (1291,449,1141,'Impulsion',0,15.0,2000,1500,4,0,0,0);
-INSERT INTO `mob_skill` VALUES (1292,449,1143,'Absolute_terror',0,15.0,2000,1500,4,0,0,0);
-INSERT INTO `mob_skill` VALUES (1293,449,1142,'Horrible_roar',0,15.0,2000,1500,4,0,0,0);
-INSERT INTO `mob_skill` VALUES (1295,449,1136,'Megaflare',0,15.0,2000,1500,4,0,0,0);
-INSERT INTO `mob_skill` VALUES (1296,449,1137,'Gigaflare',0,15.0,2000,1500,4,0,0,0);
-INSERT INTO `mob_skill` VALUES (1297,449,1138,'Teraflare',0,15.0,2000,1500,4,0,0,0);
+INSERT INTO `mob_skill` VALUES (1286,449,1133,'Trample',1,15.0,2000,1500,4,0,0,1); -- //v1
+INSERT INTO `mob_skill` VALUES (1287,449,1134,'Tempest_wing',4,15.0,2000,1500,4,0,0,0); -- //v1
+INSERT INTO `mob_skill` VALUES (1288,449,1139,'Touchdown',1,15.0,2000,1500,4,0,0,1); -- //v1
+INSERT INTO `mob_skill` VALUES (1289,449,1135,'Sweeping_ Flail',1,20.0,2000,1500,4,0,0,1); --  //v1
+-- INSERT INTO `mob_skill` VALUES (1290,449,1140,'Prodigious_spike',0,15.0,2000,1500,4,0,0,0); not script
+INSERT INTO `mob_skill` VALUES (1291,449,1141,'Impulsion',0,15.0,2000,1500,4,0,0,0); -- pas script //v2
+INSERT INTO `mob_skill` VALUES (1292,449,1143,'Absolute_terror',0,15.0,2000,1500,4,0,0,0); -- //v1 OK
+INSERT INTO `mob_skill` VALUES (1293,449,1142,'Horrible_roar',0,25.0,2000,1500,4,0,0,0); -- ?? //v2
+INSERT INTO `mob_skill` VALUES (1295,449,1136,'Megaflare',4,15.0,2000,1500,4,0,0,0); -- pas script //v1 //v2  OK
+INSERT INTO `mob_skill` VALUES (1296,449,1137,'Gigaflare',4,15.0,2000,1500,4,0,0,0); -- pas script //v1 //v2  OK
+INSERT INTO `mob_skill` VALUES (1297,449,1138,'Teraflare',4,15.0,2000,1500,4,0,0,0); -- pas script //v2
 
 -- Prishe
 INSERT INTO `mob_skill` VALUES (1229,476,1091,'Hundred_Fists',0,7.0,2000,0,1,0,1,0);
Index: sql/mob_spawn_points.sql
===================================================================
--- sql/mob_spawn_points.sql	(revision 9017)
+++ sql/mob_spawn_points.sql	(working copy)
@@ -2508,7 +2508,7 @@
 INSERT INTO `mob_spawn_points` VALUES (16830500,'Moblin_Clergyman','Moblin Clergyman',401,0,0,0,0);
 INSERT INTO `mob_spawn_points` VALUES (16830501,'Bugboy','Bugboy',387,-459.589,121.532,16.424,27);
 INSERT INTO `mob_spawn_points` VALUES (16830503,'Bugboy','Bugboy',387,20.138,1.532,16.883,83);
-INSERT INTO `mob_spawn_points` VALUES (16830505,'Bugboy','Bugboy',387,0,0,0,0);
+INSERT INTO `mob_spawn_points` VALUES (16830505,'Bugboy','Bugboy',387,499,-117,19,62);
 INSERT INTO `mob_spawn_points` VALUES (16830507,'Moblin_Fantoccinian','Moblin Fantocciniman',402,-460.744,121.5,9.581,64);
 INSERT INTO `mob_spawn_points` VALUES (16830509,'Fantoccini','Fantoccini',391,-460.877,120.524,3.321,40);
 INSERT INTO `mob_spawn_points` VALUES (16830510,'Fantoccini_Monster','Fantoccini Monster',394,-458.769,121.532,19.387,39);
@@ -5192,17 +5192,17 @@
 INSERT INTO `mob_spawn_points` VALUES (16896154,'Book_Browser_Bokabraq','Book Browser Bokabraq',787,289.313,91.846,828.107,232);
 INSERT INTO `mob_spawn_points` VALUES (16896155,'Unstable_Cluster','Unstable Cluster',807,307.5,-1.5,-706.5,186);
 INSERT INTO `mob_spawn_points` VALUES (16896156,'Bahamut','Bahamut',786,-691.716,0.411,817.579,198);
-INSERT INTO `mob_spawn_points` VALUES (16896157,'Bahamut','Bahamut',786,-704.021,0.168,822.955,229);
+INSERT INTO `mob_spawn_points` VALUES (16896157,'Bahamut','Bahamut',11198,-704.021,0.168,822.955,229);
 INSERT INTO `mob_spawn_points` VALUES (16896158,'Ouryu','Ouryu',799,-694.789,0.099,825.472,255);
 INSERT INTO `mob_spawn_points` VALUES (16896159,'Tiamat','Tiamat',806,-696.976,0.151,821.501,208);
 INSERT INTO `mob_spawn_points` VALUES (16896160,'Jormungand','Jormungand',794,-704.433,0.464,798.733,150);
 INSERT INTO `mob_spawn_points` VALUES (16896161,'Vrtra','Vrtra',808,-694.231,0.024,830.624,57);
 INSERT INTO `mob_spawn_points` VALUES (16896162,'Ziryu','Ziryu',810,1,1,1,49);
-INSERT INTO `mob_spawn_points` VALUES (16896163,'Ziryu','Ziryu',810,0,0,0,0);
-INSERT INTO `mob_spawn_points` VALUES (16896164,'Ziryu','Ziryu',810,0,0,0,0);
-INSERT INTO `mob_spawn_points` VALUES (16896165,'Ziryu','Ziryu',810,0,0,0,0);
-INSERT INTO `mob_spawn_points` VALUES (16896166,'Water_Elemental','Water Elemental',809,0,0,0,0);
-INSERT INTO `mob_spawn_points` VALUES (16896167,'Earth_Elemental','Earth Elemental',790,0,0,0,0);
+INSERT INTO `mob_spawn_points` VALUES (16896163,'Ziryu','Ziryu',810,1,1,1,4);
+INSERT INTO `mob_spawn_points` VALUES (16896164,'Ziryu','Ziryu',810,1,1,1,4);
+INSERT INTO `mob_spawn_points` VALUES (16896165,'Ziryu','Ziryu',810,1,1,1,4);
+INSERT INTO `mob_spawn_points` VALUES (16896166,'Water_Elemental','Water Elemental',809,1,1,1,1);
+INSERT INTO `mob_spawn_points` VALUES (16896167,'Earth_Elemental','Earth Elemental',790,1,1,1,1);
 INSERT INTO `mob_spawn_points` VALUES (16896168,'Pey','Pey',800,-688.086,-0.043,836.809,113);
 INSERT INTO `mob_spawn_points` VALUES (16896169,'Pey','Pey',800,-684.670,0.217,824.265,181);
 INSERT INTO `mob_spawn_points` VALUES (16896170,'Iruci','Iruci',793,-699.758,0.285,802.629,104);
Index: sql/mob_spell_lists.sql
===================================================================
--- sql/mob_spell_lists.sql	(revision 9017)
+++ sql/mob_spell_lists.sql	(working copy)
@@ -1378,9 +1378,19 @@
 -- Yali
 INSERT INTO `mob_spell_lists` VALUES ('Yali', 135, 357, 1, 255);
 INSERT INTO `mob_spell_lists` VALUES ('Yali', 135, 360, 1, 255);
+-- bahamut
+INSERT INTO `mob_spell_lists` VALUES ('Bahamut', 136, 5, 1, 255); -- Cure V
+INSERT INTO `mob_spell_lists` VALUES ('Bahamut', 136, 47, 1, 255); -- Protect V
+INSERT INTO `mob_spell_lists` VALUES ('Bahamut', 136, 52, 1, 255); -- Shell V
+INSERT INTO `mob_spell_lists` VALUES ('Bahamut', 136, 54, 1, 255); -- Stoneskin
+INSERT INTO `mob_spell_lists` VALUES ('Bahamut', 136, 106, 1, 255); -- Phalanx
+INSERT INTO `mob_spell_lists` VALUES ('Bahamut', 136, 148, 1, 255); -- Fire V
+INSERT INTO `mob_spell_lists` VALUES ('Bahamut', 136, 205, 1, 255); -- Flare II
+INSERT INTO `mob_spell_lists` VALUES ('Bahamut', 136, 177, 1, 255); -- Firaga IV
+INSERT INTO `mob_spell_lists` VALUES ('Bahamut', 136, 359, 1, 255); -- Silencega
+INSERT INTO `mob_spell_lists` VALUES ('Bahamut', 136, 360, 1, 255); -- Dispelga
+INSERT INTO `mob_spell_lists` VALUES ('Bahamut', 136, 366, 1, 255); -- Graviga
 
-
-
 /*!40000 ALTER TABLE `mob_spell_lists` ENABLE KEYS */;
 UNLOCK TABLES;
 /*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
Index: sql/npc_list.sql
===================================================================
--- sql/npc_list.sql	(revision 9017)
+++ sql/npc_list.sql	(working copy)
@@ -746,7 +746,9 @@
 
 INSERT INTO `npc_list` VALUES (16830579,'AchieveMaster','Achieve Master',0,0,0,0,0,50,50,0,0,0,2,3,0x0000320000000000000000000000000000000000,0,'SOA');
 INSERT INTO `npc_list` VALUES (16830580,'UnityMaster','Unity Master',0,0,0,0,0,50,50,0,0,96,2,2051,0x0000340000000000000000000000000000000000,0,'SOA');
-
+INSERT INTO `npc_list` VALUES (16830581,'Armoury_Crate','Armoury Crate',27,-459.589,121.532,16.424,7,40,40,0,8,0,6,1155,0x0000C10300000000000000000000000000000000,0,'COP');
+INSERT INTO `npc_list` VALUES (16830582,'Armoury_Crate','Armoury Crate',27,20.138,1.532,16.883,6,40,40,0,8,0,6,1155,0x0000C10300000000000000000000000000000000,0,'COP');
+INSERT INTO `npc_list` VALUES (16830583,'Armoury_Crate','Armoury Crate',27,499,-117,19,16,40,40,0,8,0,6,1155,0x0000C10300000000000000000000000000000000,0,'COP');
 INSERT INTO `npc_list` VALUES (16830586,'_0d0','Shaft Entrance',0,-54.500,-121.716,-579.972,1,40,40,9,0,0,0,4099,0x0200000000000000000000000000000000000000,0,'COP');
 INSERT INTO `npc_list` VALUES (16830587,'_0d1','Shaft Entrance',0,-534.497,118.279,-99.770,1,40,40,9,0,0,0,4099,0x0200000000000000000000000000000000000000,0,'COP');
 INSERT INTO `npc_list` VALUES (16830588,'_0d2','Shaft Entrance',0,-54.506,-1.631,-100.019,1,40,40,9,0,0,0,4099,0x0200000000000000000000000000000000000000,0,'COP');
Index: src/map/battlefield.cpp
===================================================================
--- src/map/battlefield.cpp	(revision 9017)
+++ src/map/battlefield.cpp	(working copy)
@@ -336,7 +336,7 @@
 bool CBattlefield::allEnemiesDefeated(){
 	bool allDefeated = true;
 	for(int i=0; i<m_EnemyVictoryList.size(); i++){
-		if(m_EnemyVictoryList.at(i).MobEntity->PBattleAI->GetCurrentAction() >= 20 && m_EnemyVictoryList.at(i).MobEntity->PBattleAI->GetCurrentAction() <= 23){
+		if(m_EnemyVictoryList.at(i).MobEntity->PBattleAI->GetCurrentAction() >= 22 && m_EnemyVictoryList.at(i).MobEntity->PBattleAI->GetCurrentAction() <= 23){
 			m_EnemyVictoryList.at(i).killed = true;
 		}
 		if(m_EnemyVictoryList.at(i).killed == false){
Index: src/map/battlefield_handler.cpp
===================================================================
--- src/map/battlefield_handler.cpp	(revision 9017)
+++ src/map/battlefield_handler.cpp	(working copy)
@@ -40,7 +40,7 @@
 
 	//Dynamis zone (need to add COP dyna zone)
 	//added ghelsba outpost here, 1 battlefield only
-	if (m_ZoneId > 184 && m_ZoneId < 189 ||  m_ZoneId > 133 && m_ZoneId < 136 || m_ZoneId == 140 || m_ZoneId == 35 || m_ZoneId > 38  && m_ZoneId < 43 )
+	if (m_ZoneId > 184 && m_ZoneId < 189 || m_ZoneId > 133 && m_ZoneId < 136 || m_ZoneId == 140 || m_ZoneId == 29 || m_ZoneId == 30 || m_ZoneId == 35 || m_ZoneId > 38 && m_ZoneId < 43)
     {
 		m_MaxBattlefields = 1;
 	}

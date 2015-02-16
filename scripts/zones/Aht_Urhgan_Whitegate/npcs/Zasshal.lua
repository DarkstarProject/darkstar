-----------------------------------
--  Area: Aht Urhgan Whitegate
--  NPC:  Zasshal
--  Type: Salvage
--  @pos 101.468 -1 -20.088 50
-----------------------------------

-----------------------------------
--  not implemented yet: Zasshal should only give one remnants permit per RL day (once every JP day on retail servers).
--
-- possibly non-canonical functionality: when you already have a Remnants Permit, Zasshal automatically tells you "Time to explain stuff
-- again.." and turns you away, even if you are on the quest "Duties, Tasks and Deeds" and may just be there to buy "Wyrmseeker of Areuhat".
-- If JP midnight has not passed yet since you last got a permit, Zasshal tells you that and the option "I'm In" is removed.
---------------------------------------------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)


------------- debug code ------------------
player:setVar("AHT_URHGAN_MISSION",17)
player:setVar("SALVAGE_COUNT",2);
---------------------------------------

--------------- Zasshal events: ---------------------------------------
-- 0x0331 : "Wot are you looking at?" (player not eligible to sign up for salvage, needs ToAU mission 17 or higher)
-- 0x0332 : CS with explanation of Salvage for first-time users + usual salvage menu
-- 0x0333 : CS + salvage menu
-- 0x0334 : "Back for more?" + salvage menu
-- 0x0335 : "Time to explain stuff again" (player already has salvage permit)
-- 0x0336 : "Here's your remnants permit".. obtained key item.
-- 0x011F : "Deal! That settles it then" (player bought Wyrmseeker of Areuhat)
-- 0x011E : CS when player is first interested in Wyrmseeker of Areuhat
------------------------------------------------------------

-- debug code ----------------------------------------------------
--player:setVar("AHT_URHGAN_MISSION",18)
--player:setVar("NYZUL_TOKENS",300000)
--player:setVAR("PLAYER_HAS_SEEN_WYRMSEEKER_CS,0);    -- is there a server mechanism for keeping track of whether a player
                                                      -- has seen a one-time CS after satisfying a condition?
------------------------------------------------------------

aht_urhgan_mission = player:getVar("AHT_URHGAN_MISSION")            -- highest completed Aht Urhgan Mission
salvage_count = player:getVar("SALVAGE_COUNT") 									    -- number of Salvage runs performed
player_has_seen_wyrmseeker_cs = player:getVar("PLAYER_HAS_SEEN_WYRMSEEKER_CS");
mythic_quest = player:getQuestStatus(6,71)            -- player on quest "Duties, Tasks and Deeds"? LogID = 6 for Aht Urhgan Quests?

-- debug code ----
-- mythic_quest = 1
-------------


leujaoam_assault_points = player:getVar("LEUJAOAM_ASSAULT_POINTS") -- retrieve assault points
mamool_assault_points = player:getVar("MAMOOL_ASSAULT_POINTS")
lebros_assault_points = player:getVar("LEBROS_ASSAULT_POINTS")
periqia_assault_points = player:getVar("PERIQIA_ASSAULT_POINTS")
ilrusi_assault_points = player:getVar("ILRUSI_ASSAULT_POINTS")
nyzul_tokens = player:getVar("NYZUL_TOKENS")

--print(leujaoam_assault_points, mamool_assault_points, lebros_assault_points, periqia_assault_points,ilrusi_assault_points);

has_remnants_permit = player:hasKeyItem(0x356);                            -- has Remnants Permit?
last_remnants_permit_bought = player:getVar("LAST_REMNANTS_PERMIT_BOUGHT");

time_elapsed = os.time()-last_remnants_permit_bought;
--print("time----",time_elapsed,"---");

if (aht_urhgan_mission < 17) then
 event = Event(0x0331)

elseif ((player_has_seen_wyrmseeker_cs == 0) and (mythic_quest == 1)) then
 event = Event(0x011E)
 player:setVar("PLAYER_HAS_SEEN_WYRMSEEKER_CS",1);

else
 if (has_remnants_permit == 1) then
   event = Event(0x0335)
 else
   if (time_elapsed >=86400)  then                                -- one RL day has passed since last permit was obtained?
     japanese_midnight_has_passed_since_last_permit = 1;          -- use this instead of midnight check for now.
   else
     japanese_midnight_has_passed_since_last_permit = 0;
   end;
   if (japanese_midnight_has_passed_since_last_permit == 0) then
     player:showText(npc,ZASSHAL_DIALOG);
     param7 = 1;  -- for disabling "I'm in" option
   else
     param7 = 0;
   end;

   if (salvage_count == 0) then
     event = Event(0x0332)
   elseif (salvage_count == 1) then
     event = Event(0x0333)
   elseif (salvage_count > 1) then
     event = Event(0x0334)
   end
   -- parameter 3: number of nyzul tokens
   -- parameter 7 == a bit mask to disable menu options
   -- other parameters unknown

   if (mythic_quest == 0) then
     param7 = param7 + 32; -- disable Wyrmseeker of Areuhat option;
   end
   event:setParams(0,0,nyzul_tokens,0,0,0,param7,0);
 end
end
player:startEvent(event);
end;

 -----------------------------------
--onEventSelection Action--
-----------------------------------
function onEventSelection(player,csid,option)
--print("onEventSelection")
--print("onEventSelection - CSID:",csid);         -- we are now in the part of the dialog where you select
--print("onEventSelection - option ===",option);  -- an area to exchange assault points from for a permit

if (option == 0) then
 player:updateEvent(leujaoam_assault_points,0,0,0,0,0,0,0)

elseif (option == 1) then
 player:updateEvent(mamool_assault_points,0,0,0,0,0,0,0)

elseif (option == 2) then
 player:updateEvent(lebros_assault_points,0,0,0,0,0,0,0)

elseif (option == 3) then
 player:updateEvent(periqia_assault_points,0,0,0,0,0,0,0)

elseif (option == 4) then
 player:updateEvent(ilrusi_assault_points,0,0,0,0,0,0,0)

elseif (option == 10) then -- player traded Leujaoam points for permit
 player:setVar("LEUJAOAM_ASSAULT_POINTS",leujaoam_assault_points-1500)

elseif (option == 11) then -- player traded Mamool points for permit
 player:setVar("MAMOOL_ASSAULT_POINTS",mamool_assault_points-1500)

elseif (option == 12) then -- player traded Lebros points for permit
 player:setVar("LEBROS_ASSAULT_POINTS",lebros_assault_points-1500)

elseif (option == 13) then -- player traded Periqia points for permit
 player:setVar("PERIQIA_ASSAULT_POINTS",periqia_assault_points-1500)

elseif (option == 14) then -- player traded Ilrusi points for permit
 player:setVar("ILRUSI_ASSAULT_POINTS",ilrusi_assault_points-1500)
end
end;


-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end;


-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (option == 100) then                 			-- player wants a permit
  player:addKeyItem(0x356);           				-- give player a remnants permit
  player:messageSpecial(KEYITEM_OBTAINED,0x356);
  player:setVar("LAST_REMNANTS_PERMIT_BOUGHT",os.time());
elseif (option == 101) then						  	-- player bought "copy of Wyrmseeker of Areuhat" for 150,000 Nyzul tokens
  player:addItem(2489);
  player:messageSpecial(ITEM_OBTAINED,2489);
  player:setVar("NYZUL_TOKENS",nyzul_tokens-150000)
end
end;

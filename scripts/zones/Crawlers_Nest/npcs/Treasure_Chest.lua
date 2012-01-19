-----------------------------------
-- NPC: 
-- Quest NPC
-- @pos -15 0 244
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/Treasure");
package.loaded["scripts/zones/Crawlers_Nest/TextIDs"] = nil;
require("scripts/zones/Crawlers_Nest/TextIDs");
ChestLvl = 53;
        minlv = 43;
        NestChestKey = 1040;
	  skeletonKey = 1115;
        livingKey = 1023;
         thftools = 1022;
  
 skSuccessIncrement = 0.2
 lkSuccessIncrement = 0.15
ttkSuccessIncrement = 0.1
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
count = trade:getItemCount();
  key = trade:hasItemQty(NestChestKey,1);
   sk = trade:hasItemQty(skeletonKey,1);
   lk = trade:hasItemQty(livingKey,1);
  ttk = trade:hasItemQty(thftools,1);
  gil = trade:getGil();
  eid = 0;
  CrawlerBlood = 201;
-- Enveloped in Darkness 
-- third condition added by ReaperX so player will only obtain key item after talking to Curilla again
if(player:getQuestStatus(0,85) == 1 and player:hasKeyItem(CrawlerBlood) == false) and (player:getVar("needs_crawler_blood") == 1) then
 eid = 1
end

if ((key or sk or lk or ttk) and count and gil == 0) then  -- Player traded a key and zero gil.
	weak = player:getVar("weakenedByCofferTill");          -- This a temporal solution till setPlayerStatus() function is implemented.          
	illu  = player:getVar("TreasureChestCrawlersNest");        -- SE impleted this in order to prevent coffer farming. Noone in the same area can open more than 1 coffer per hour except for AF and maps.
	if(os.time() <= weak) then
		player:messageSpecial(CHEST_WEAK);
		success = -1;
	elseif( illu > os.time() and eid == 0) then
		player:specialMessage(CHEST_ILLUSION);
		-- here should be a function in order to depop the coffer and pop the coffer in another location after 5 minutes.
		success = -2; -- If traded a key or any THF tool it won't be wasted if chest is illusion time.
	elseif (key) then 									  -- if player trades a Zone Key success is always 100%
		success = 1; 
	elseif ( player:getMainJob() == 6 and player:getMainLvl() >= minlv ) then -- if player is THF with level higher or equal than minimun lv for coffer
		if    (ttk) then
			success = (player:getMainLvl()/ChestLvl) - 0.50 + ttkSuccessIncrement;
		elseif(lk) then
			success = (player:getMainLvl()/ChestLvl) - 0.50 + lkSuccessIncrement;
		elseif(sk) then
			success = (player:getMainLvl()/ChestLvl) - 0.50 + skSuccessIncrement;
		end
	else
		-- Player is not THF (as main job) or doesn't haven enough level to open the coffer
		player:messageSpecial(CHEST_FAIL,1,1,1);
		success = -1;
	end
	if(not(success == -2)) then
		diceroll = math.random();
		player:tradeComplete();
		if (diceroll <= success) then
		-- Succeded to open the coffer
			player:messageSpecial(CHEST_UNLOCKED);
			if(eid == 1) then
				player:addKeyItem(CrawlerBlood);
				player:messageSpecial(KEYITEM_OBTAINED,CrawlerBlood);
				player:setVar("needs_crawler_blood",0) -- cleanup
			else
				setGlobalVar("TreasureChestCrawlersNest",os.time() + math.random(CHEST_MIN_ILLUSION_TIME,CHEST_MAX_ILLUSION_TIME));
				local loot = chestLoot(player:getZone());
				--print("loot array: "); -- debug
				--print("[1]", loot[1]); -- debug
				--print("[2]", loot[2]); -- debug
				if (loot[1]=="gil") then
					player:addGil(loot[2]);
					player:messageSpecial(GIL_OBTAINED,loot[2]);
				else
					-- Item
					player:addItem(loot[2]);
					player:messageSpecial(ITEM_OBTAINED,loot[2]);
				end
			end
		else
		-- Failed to open the coffer.
			if (success ~= -1 ) then -- success -1 means it failed cause of weakness or illusionTime. Other value means it normally failed to open
				-- Now checking if It is a critical failure
				critfailureroll = math.random();
				--print("roll for critical failure",critfailureroll); -- debug
				if (critfailureroll<=0.2) then -- 20% chance
					--print("critical failure:Player is weakened");   -- debug
					-- Here would go a function for setting weakness status to the player for a duration from 5 minutes to 1 hour
					player:setVar("weakenedByCofferTill",os.time() + math.random(300,3600));			
					player:messageSpecial(CHEST_TRAP);
				else
					player:messageSpecial(CHEST_FAIL,1,1,1);
				end
			end
		end
	end -- traded a key during illusion time you key is not wasted.
end -- traded a key

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
player:messageSpecial(CHEST_LOCKED,NestChestKey);
	end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

end;
-----------------------------------
--  Area: Carpenters' Landing
--   NPC: ???
--  Type: COP mission

-- 
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Carpenters_Landing/TextIDs"] = nil;
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
   if(player:getCurrentMission(COP) == CALM_BEFORE_THE_STORM )then
   
   
    local ExecutorID = 16785710;
    local Assassin1ID  = 16785711;
    local Assassin2ID  = 16785712;
    local Assassin3ID = 16785713;
    local Executor = GetMobAction(ExecutorID);  --Cryptonberry_Executor
    local Assassin1 = GetMobAction(Assassin1ID);  --Cryptonberry_Assassins-1
    local Assassin2 = GetMobAction(Assassin2ID);  --Cryptonberry_Assassins-2
    local Assassin3 = GetMobAction(Assassin3ID);  --Cryptonberry_Assassins-3
    local Assassin1kill= player:getVar("Cryptonberry_Assassins-1_KILL");
    local Assassin2kill= player:getVar("Cryptonberry_Assassins-2_KILL");
    local Assassin3kill= player:getVar("Cryptonberry_Assassins-3_KILL");
    local Executorkill = player:getVar("Cryptonberry_Executor_KILL");
   	 --printf("Assassin1: %u",Assassin1kill);
	 --printf("Assassin2: %u",Assassin2kill);
     --printf("Assassin3: %u",Assassin3kill);
	 --printf("Executor: %u",Executorkill);
   
        if(Executorkill==1 and Assassin1kill ==1 and Assassin2kill==1 and Assassin3kill==1 )then --si tout les mob on été tuer
         player:startEvent(0x0025);
        elseif(Executor == 0 and Assassin1 == 0 and Assassin2 == 0 and Assassin3 == 0 and Executorkill~=2)then--si aucun mob n'est pop et que la cs n'est pas vue
			  SpawnMob(16785710,180):updateEnmity(player);
	          SpawnMob(16785711,420);
	          SpawnMob(16785712,420);
	          SpawnMob(16785713,420);	
         else
		 player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
        end
  else
   player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
  end
   
   


end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
	if(csid == 0x0025)then
	   player:setVar("Cryptonberry_Executor_KILL",2);
	   player:setVar("Cryptonberry_Assassins-1_KILL",0);
	   player:setVar("Cryptonberry_Assassins-2_KILL",0);
	   player:setVar("Cryptonberry_Assassins-3_KILL",0);
	end
end;


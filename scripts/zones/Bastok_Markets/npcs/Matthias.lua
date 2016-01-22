-----------------------------------
-- Area: Bastok Markets
-- NPC: Matthias
-- Standard Info NPC
-- Involved in Quest:
-----------------------------------

require("scripts/globals/quests");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getVar("dancerTailorCS") == 4) then --and player:getQuestStatus(JEUNO,THE_ROAD_TO_DIVADOM) == QUEST_COMPLETE
        local playersAFChoice = player:getVar("dancerAFChoice");
		
            if(playersAFChoice == 1 and --imperial silk: 2340, wolf felt: 2010, silver brocade: 1991
                trade:hasItemQty(2340, 1) == true and
                trade:hasItemQty(2010, 1) == true and
                trade:hasItemQty(1991, 1) == true and
                trade:getItemCount() == 3 and
                trade:getGil() == 0) then
				
                rewardThePlayer(player);
				
             elseif(playersAFChoice == 2 and --karakul cloth: 2288, rainbow cloth: 830, rainbow velvet: 1996
                trade:hasItemQty(2288, 1) == true and
                trade:hasItemQty(830, 1) == true and
                trade:hasItemQty(1996, 1) == true and
                trade:getItemCount() == 3 and
                trade:getGil() == 0) then
				
                rewardThePlayer(player);
				
             elseif(playersAFChoice == 3 and --wamoura cloth: 2289, moblinweave: 1636, rainbow velvet: 1999
                trade:hasItemQty(2289, 1) == true and
                trade:hasItemQty(1636, 1) == true and
                trade:hasItemQty(1999, 1) == true and
                trade:getItemCount() == 3 and
                trade:getGil() == 0) then
				
                rewardThePlayer(player);
            end;
     end;
end; 

function rewardThePlayer(player)
    local playersAFChoice = player:getVar("dancerAFChoice");
    local currentVanaDay = VanadielDayOfTheYear();
    player:setVar("dancerTailorWorkDay", currentVanaDay);
    player:setVar("dancerTailorCS", 5);
    player:tradeComplete();
    player:startEvent(0x01EF, playersAFChoice-1);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
    local playersAFChoice = player:getVar("dancerAFChoice");
    local tailorStartedWorkDay = player:getVar("dancerTailorWorkDay");
	
    if(player:getVar("dancerTailorCS") == 2) then
        player:startEvent(0x01EC);
    elseif(player:getVar("dancerTailorCS") == 3) then
		
        local completedPieces = player:getVar("dancerCompletedAF");
		
        local playerCompletedTiara = 0;
        if(bit.band(completedPieces,1) > 0) then
            playerCompletedTiara = 1;
        end;
		
        local playerCompletedBangles = 0;
        if(bit.band(completedPieces,2) > 0) then
            playerCompletedBangles = 1;
        end;
		
        local playerCompletedShoes = 0;
        if(bit.band(completedPieces,4) > 0) then
            playerCompletedShoes = 1;
        end;
		
        local completedPieces = playerCompletedShoes + playerCompletedBangles + playerCompletedTiara;
        if(completedPieces == 3) then 
            player:setVar("dancerTailorCS", 6);
            player:startEvent(0x01F2);
         else
            player:startEvent(0x01ED, playerCompletedTiara, playerCompletedBangles, playerCompletedShoes);
        end;
		
    elseif(player:getVar("dancerTailorCS") == 4) then
			
        player:startEvent(0x01EE, playersAFChoice -1); -- event params indexed from 0
	
    elseif(player:getVar("dancerTailorCS") == 5 )then
	
        local currentVanaDay = VanadielDayOfTheYear();
		
        if(player:getFreeSlotsCount() == 0) then
		
            player:PrintToPlayer( "Not enough free inventory space." );
			
        elseif(currentVanaDay > tailorStartedWorkDay ) then
			
            local dancerAFID = 1; -- variable used to convert player's choice into an Item ID. gender is actually important here because it displays the item on screen for you
            local playerGender = player:getGender();
			
            switch (playersAFChoice) : caseof{
                [1] = function(x)
                    dancerAFID = 16139 - playerGender; --tiara
                    end,
                [2] = function(x)
                    dancerAFID =  15003 - playerGender;--bangles
                    end,
                [3] = function(x)
                    dancerAFID = 15747 - playerGender; --toe shoes
                    end,
                }
			
            player:startEvent(0x01F1, dancerAFID);
        else
            player:startEvent(0x01F0); -- not enough time has passed
        end;
    elseif(player:getVar("dancerTailorCS") == 6) then
        player:startEvent(0x01F2);
    else
        player:startEvent(0x01F3);
    end;
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
	
	local completedPieces = player:getVar("dancerCompletedAF");

	if(csid == 0x01EC) then
	
		if(option > 0) then -- option 1 - tiara 2 - bangles 3 - shoes
			player:setVar("dancerAFChoice", option);
			player:setVar("dancerTailorCS", 4);
		else
			player:setVar("dancerTailorCS", 3); 
		end;
		
	elseif(csid == 0x01ED) then
	
		if(option > 0) then -- option 1 - tiara 2 - bangles 3 - shoes
			
			local choiceBit = bit.lshift(1, option - 1) --check to see if the player already did this piece already

			if(bit.band(choiceBit, completedPieces) == choiceBit) then
				player:startEvent(0x01F2); 
		
			else
				player:setVar("dancerAFChoice", option);
				player:setVar("dancerTailorCS", 4);
			end;
		end;
		
	elseif(csid == 0x01F1) then -- reward player the appropriate AF
	
		local dancerAFID = 1; -- variable used to convert player's choice into an Item ID.	
		local playerGender = player:getGender();
		local playersAFChoice = player:getVar("dancerAFChoice");
		
		switch (playersAFChoice) : caseof{
			[1] = function(x)
				dancerAFID = 16139; --tiara
				end,
			[2] = function(x)
				dancerAFID =  15003;--bangles
				end,
			[3] = function(x)
				dancerAFID = 15747; --toe shoes
				end,
		}

		player:addItem(dancerAFID - playerGender);
		player:messageSpecial(ITEM_OBTAINED, dancerAFID);
		
		local allPiecesCompleted = 7;
		if(bit.band(completedPieces, allPiecesCompleted) == allPiecesCompleted) then
			player:setVar("dancerTailorCS",6); -- final cs flag
		else
			local playersReward = bit.lshift(1, playersAFChoice - 1)
			completedPieces = bit.bor(completedPieces, playersReward);
			player:setVar("dancerCompletedAF", completedPieces);
			player:setVar("dancerTailorCS", 3);
		end;
	else
	    --do nothing
	end;
end;
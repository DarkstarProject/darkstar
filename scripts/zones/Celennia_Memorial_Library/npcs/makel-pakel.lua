-----------------------------------
-- Area: Celennia_Memorial_Library
-- NPC:  MakelPakel
-- Type: Standard 0NPC
-----------------------------------
package.loaded["scripts/zones/Celennia_Memorial_Library/TextIDs"] = nil;
-----------------------------------


require("scripts/zones/Celennia_Memorial_Library/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

count = trade:getItemCount();


itemQuality = 0;

		 

	if(trade:hasItemQty(2488,30,14554,1) and count == 31) then -- usukane haramaki +1
        player:tradeComplete();
        player:addItem(27790);

     elseif(trade:hasItemQty(2488,30,14550,1) and count == 31) then -- skadi's cuirie +1
        player:tradeComplete(); 
        player:addItem(27789);

     elseif(trade:hasItemQty(2488,30,14562,1) and count == 31) then -- Morrigan's robe +1
        player:tradeComplete(); 
        player:addItem(27792);

     elseif(trade:hasItemQty(2488,30,14546,1) and count == 31) then -- Ares Cuirass +1
        player:tradeComplete(); 
        player:addItem(27788);
		
	 elseif(trade:hasItemQty(2488,30,14558,1) and count == 31) then -- Maruduk's Jubbah +1
        player:tradeComplete(); 
        player:addItem(27791);

     elseif(trade:hasItemQty(2488,20,15633,1) and count == 21) then -- Usukane Hizayoroi +1
        player:tradeComplete(); 
        player:addItem(28073);
		
	 elseif(trade:hasItemQty(2488,20,15629,1) and count == 21) then -- Skadi's Chausses +1
        player:tradeComplete(); 
        player:addItem(28072);
		
     elseif(trade:hasItemQty(2488,20,15641,1) and count == 21) then -- Morrigan's Slops +1
        player:tradeComplete(); 
        player:addItem(28075);
		
	 elseif(trade:hasItemQty(2488,20,15625,1) and count == 21) then -- Ares' Flanchard
        player:tradeComplete(); 
        player:addItem(28071);
		
	 elseif(trade:hasItemQty(2488,20,15637,1) and count == 21) then -- Marduk's Shalwar+1
        player:tradeComplete(); 
        player:addItem(28074);
		
     elseif(trade:hasItemQty(2488,20,16092,1) and count == 21) then  -- Usukane Somen +1
        player:tradeComplete(); 
        player:addItem(27650);
		
     elseif(trade:hasItemQty(2488,20,16088,1) and count == 21) then -- Skadi's Visor +1
        player:tradeComplete(); 
        player:addItem(27649);		
		
	 elseif(trade:hasItemQty(2488,20,16084,1) and count == 21) then  -- Ares' Mask
        player:tradeComplete(); 
        player:addItem(27648);	
		
	 elseif(trade:hasItemQty(2488,20,16100,1) and count == 21) then -- Morrigan's Coron 
        player:tradeComplete(); 
        player:addItem(27652);	
		
	 elseif(trade:hasItemQty(2488,20,16096,1) and count == 21) then  -- Marduk's Tiara
        player:tradeComplete(); 
        player:addItem(27651);	
		
	 elseif(trade:hasItemQty(2488,10,14969,1) and count == 11) then -- Usukane Gote +1
        player:tradeComplete(); 
        player:addItem(27930);

     elseif(trade:hasItemQty(2488,10,15719,1) and count == 11) then -- Usukane Sune-ate +1
        player:tradeComplete(); 
        player:addItem(28210);

     elseif(trade:hasItemQty(2488,10,14965,1) and count == 11) then -- Skadi Bazubands +1
        player:tradeComplete(); 
        player:addItem(27929);

     elseif(trade:hasItemQty(2488,10,15715,1) and count == 11) then -- Skadi's Jambeaux +1
        player:tradeComplete();	
        player:addItem(28209);

     elseif(trade:hasItemQty(2488,10,14977,1) and count == 11) then -- Morrigan's Cuffs +1
        player:tradeComplete(); 
        player:addItem(27932);

     elseif(trade:hasItemQty(2488,10,15727,1) and count == 11) then -- Morrigan Pgch +1
        player:tradeComplete();	
        player:addItem(28212);

     elseif(trade:hasItemQty(2488,10,15723,1) and count == 11) then -- Marduk's Crackows +1
        player:tradeComplete(); 
        player:addItem(28211);

     elseif(trade:hasItemQty(2488,10,14973,1) and count == 11) then -- Marduk's Dastanas +1
        player:tradeComplete(); 
        player:addItem(27931);

     elseif(trade:hasItemQty(2488,10,14961,1) and count == 11) then -- Ares Gauntlet +1
        player:tradeComplete(); 
        player:addItem(27928);

     elseif(trade:hasItemQty(2488,10,15711,1) and count == 11) then -- Ares Sollerets +1
         player:tradeComplete(); 
         player:addItem(28208);	
         
      
      
      end
   
  
   

end; 


-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
   player:startEvent(0x278D);
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

   if (csid == 0x278D and option == 1002) then
      player:tradeComplete();
      player:addItem(objecttrade);
      player:messageSpecial(ITEM_OBTAINED,objecttrade);
      
      
   end
end;
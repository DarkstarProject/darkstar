-----------------------------------
--  Area: Newton Movalpolos
--   NPC: Furnace_Hatch
--  Type: 
-- @zone: 
--  @pos 
-- 
-- 
-----------------------------------
package.loaded["scripts/zones/Newton_Movalpolos/TextIDs"] = nil;
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
 if(trade:getItemCount() == 1 and trade:hasItemQty(947,1)) then
    player:tradeComplete(); 
    local npcid = npc:getID();
   if(npcid == 16826608 or npcid ==16826607 or npcid == 16826606)then
      if(GetNPCByID(16826589):getAnimation() == 8)then
        GetNPCByID(16826589):setAnimation(9);  
        GetNPCByID(16826590):setAnimation(8);
        GetNPCByID(16826587):setAnimation(9);
	    GetNPCByID(16826588):setAnimation(8);
      else
        GetNPCByID(16826589):setAnimation(8);
        GetNPCByID(16826590):setAnimation(9);
	    GetNPCByID(16826587):setAnimation(8);
        GetNPCByID(16826588):setAnimation(9);
      end
   elseif (npcid == 16826604)then
     if(GetNPCByID(16826582):getAnimation() == 8)then
	   GetNPCByID(16826582):setAnimation(9); 
	   GetNPCByID(16826581):setAnimation(8);
	   GetNPCByID(16826580):setAnimation(9);
	   GetNPCByID(16826579):setAnimation(8);
	 else
	   GetNPCByID(16826582):setAnimation(8); 
	   GetNPCByID(16826581):setAnimation(9);
	   GetNPCByID(16826580):setAnimation(8);
	   GetNPCByID(16826579):setAnimation(9);
	 end
   elseif (npcid == 16826605)then  
        if(GetNPCByID(16826583):getAnimation() == 8)then
	   GetNPCByID(16826583):setAnimation(9); 
	   GetNPCByID(16826584):setAnimation(8);
	   GetNPCByID(16826585):setAnimation(9);
	   GetNPCByID(16826586):setAnimation(8);
	 else
	   GetNPCByID(16826583):setAnimation(8); 
	   GetNPCByID(16826584):setAnimation(9);
	   GetNPCByID(16826585):setAnimation(8);
	   GetNPCByID(16826586):setAnimation(9);
	 end
   
   end		 
 end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)   
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

end;
-----------------------------------
-- Area: Temenos
-- NPC:  Scanning_Device
-- @pos 
-----------------------------------
require("scripts/globals/limbus");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

   player:startEvent(0x0079,511);

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
  -- printf("CSID: %u",csid);
   printf("RESULT: %u",option); 
   Xtime=0;
--=player:getSpecialInstanceLeftTime();   
 switch (option): caseof {     
        [1] = function (x) -- N
Xtime=player:getSpecialInstanceLeftTime(2);
		end,
        [2] = function (x) -- E
Xtime=player:getSpecialInstanceLeftTime(1);
		end,
		[3] = function (x) -- O
Xtime=player:getSpecialInstanceLeftTime(3);
		end,
		[4] = function (x) -- 4E 
Xtime=player:getSpecialInstanceLeftTime(8);
		end,
		[5] = function (x) -- 3E
Xtime=player:getSpecialInstanceLeftTime(7);
		end,
		[6] = function (x) -- 2E
Xtime=player:getSpecialInstanceLeftTime(6);
		end,
		[7] = function (x) -- 1E
Xtime=player:getSpecialInstanceLeftTime(5);
		end,
		[8] = function (x) -- SS
Xtime=player:getSpecialInstanceLeftTime(4);
		end,	
                             }		
 player:updateEvent(0,Xtime,0,0,0,0,0,0);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
   if(csid == 0)then

   end
end;
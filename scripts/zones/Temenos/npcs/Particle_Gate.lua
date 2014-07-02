-----------------------------------
-- Area: temenos
-- NPC:  Particle_Gate
-- @pos 
-----------------------------------
package.loaded["scripts/zones/Temenos/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/limbus");
require("scripts/globals/keyitems");
require("scripts/zones/Temenos/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
  GateID =  (npc:getID())-16928770;  
  -- print("GateID" ..GateID);
  
  
 switch (GateID): caseof {
         -- 100 a 106 inclut (Temenos -Northern Tower )
        [450] = function (x)
             player:startEvent(100);
		end	, 
		[451] = function (x)
             player:startEvent(101);
		end	, 
		[452] = function (x)
             player:startEvent(102);
		end	, 
		[453] = function (x)
             player:startEvent(103);
		end	, 
		[454] = function (x)
             player:startEvent(104);
		end	, 
		[455] = function (x)
             player:startEvent(105);
		end	, 
		[456] = function (x)
             player:startEvent(106);
		end	, 
		-- ------107 a 113-----------(Temenos - Eastern Tower)
		[457] = function (x)
             player:startEvent(107);
		end	, 
		[458] = function (x)
             player:startEvent(108);
		end	, 
		[459] = function (x)
             player:startEvent(109);
		end	, 
		[460] = function (x)
             player:startEvent(110);
		end	, 
		[461] = function (x)
             player:startEvent(111);
		end	, 
		[462] = function (x)
             player:startEvent(112);
		end	, 
		[463] = function (x)
             player:startEvent(113);
		end	, 
		-- --------------------------(Temenos - Western Tower)-------
		[464] = function (x)
             player:startEvent(114);
		end	, 
		[465] = function (x)
             player:startEvent(115);
		end	, 
		[466] = function (x)
             player:startEvent(116);
		end	, 
		[467] = function (x)
             player:startEvent(117);
		end	, 
		[468] = function (x)
             player:startEvent(118);
		end	, 
		[469] = function (x)
             player:startEvent(119);
		end	, 
		[470] = function (x)
             player:startEvent(120);
		end	, 
		--
		[471] = function (x)
             player:startEvent(120);
		end	,
		[472] = function (x)
             player:startEvent(120);
		end	,
		[473] = function (x)
             player:startEvent(120);
		end	,
		[474] = function (x)
             player:startEvent(120);
		end	,
		[475] = function (x)
             player:startEvent(120);
		end	,
	                       	}
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)  
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;

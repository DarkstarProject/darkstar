-----------------------------------
-- Area: Bastok Markets
-- NPC: Reet
-- Adventurer's Assistant
-- @zone 235
-- @pos -237 -12 -41
-------------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/settings");
require("scripts/zones/Bastok_Markets/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade) 
	if (trade:getItemCount() == 1 and trade:hasItemQty(536,1) == true) then
		player:startEvent(0x0006);
	end
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 
	player:startEvent(0x0005);
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
	if (csid == 0x0006) then
		player:tradeComplete();
		player:addGil(GIL_RATE*50);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*50);
		

    local keyIds =
    {
        383,  385,  386,  387,  388,  389,  390,  391,  392,  393,  394,  395,  396,  397,  398,  399,  400,
        401,  402,  403,  404,  405,  406,  407,  408,  409,  410,  411,  412,  413,  414,  415,  416,  417,
        418,  419,  420,  421,  422,  423,  424,  425,  426,  427,  428,  429,  430,  431,  432,  433,  434,
        435,  436,  437,  438,  439,  440,  441,  442,  443,  444,  445,  446,  447, 1856, 1857, 1858, 1859,
        1860, 1861, 1862, 1863, 1864, 1865, 1866, 1867, 1868, 1869, 1870, 1871, 1872, 1873, 1874, 1875, 1876,
        1877, 1878, 1879, 1880, 1881, 1882, 1883, 1884, 1885, 1886, 1887, 1888, 1889, 1890, 1891, 1892, 1893,
        1894, 1895, 1896, 1897, 1898, 1899, 1900, 1901, 1902, 1903
    };
   
        for _, v in ipairs( keyIds ) do
            player:addKeyItem( v );
        end

	end
end;
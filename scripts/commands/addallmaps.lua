-----------------------------------
--	[Command name]: addallmaps
--	[Author      ]: Joe
--	[Description ]: Adds all maps to the given player. They must be online for this to work.
-----------------------------------

require("scripts/globals/keyitems");

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player, target)


    local keyids = {  383,  385,  386,  387,  388,  389,  390,  391,  392,  393,  394,  395,  396,  397,  398,  399,  400,
		401,  402,  403,  404,  405,  406,  407,  408,  409,  410,  411,  412,  413,  414,  415,  416,  417,
		418,  419,  420,  421,  422,  423,  424,  425,  426,  427,  428,  429,  430,  431,  432,  433,  434,
		435,  436,  437,  438,  439,  440,  441,  442,  443,  444,  445,  446,  447, 1856, 1857, 1858, 1859,
	       1860, 1861, 1862, 1863, 1864, 1865, 1866, 1867, 1868, 1869, 1870, 1871, 1872, 1873, 1874, 1875, 1876,
	       1877, 1878, 1879, 1880, 1881, 1882, 1883, 1884, 1885, 1886, 1887, 1888, 1889, 1890, 1891, 1892, 1893 }

	if(target == nil) then
		target = player;
	end

	local pc = GetPlayerByName(target); -- If you use this command on yourself you will see an error in your gameserver here, it's OK though.
	if (pc~=nil) then
		for i, keyid in ipairs(keyids) do
			pc:addKeyItem(keyid);
		end
	else
		for i, keyid in ipairs(keyids) do
			player:addKeyItem(keyid);
		end
	end
end;